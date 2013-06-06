require 'tk'

class TkEvent::Event
  attr_accessor :x_nonzoom, :y_nonzoom
end

class TkScrolledCanvas < TkCanvas
  include TkComposite
  attr_reader :zoom

  def initialize_composite(keys={})
    @zoom = 1.0

    @h_scr = TkScrollbar.new(@frame)
    @v_scr = TkScrollbar.new(@frame)

    @canvas = TkCanvas.new(@frame)
    @path = @canvas.path

    @canvas.xscrollbar(@h_scr)
    @canvas.yscrollbar(@v_scr)

    TkGrid.rowconfigure(@frame, 0, :weight=>1, :minsize=>0)
    TkGrid.columnconfigure(@frame, 0, :weight=>1, :minsize=>0)

    @canvas.grid(:row=>0, :column=>0, :sticky=>'news')
    @h_scr.grid(:row=>1, :column=>0, :sticky=>'ew')
    @v_scr.grid(:row=>0, :column=>1, :sticky=>'ns')

    delegate('DEFAULT', @canvas)
    delegate('background', @frame, @h_scr, @v_scr)
    delegate('activeforeground', @h_scr, @v_scr)
    delegate('troughcolor', @h_scr, @v_scr)
    delegate('repeatdelay', @h_scr, @v_scr)
    delegate('repeatinterval', @h_scr, @v_scr)
    delegate('borderwidth', @frame)
    delegate('relief', @frame)

    delegate_alias('canvasborderwidth', 'borderwidth', @canvas)
    delegate_alias('canvasrelief', 'relief', @canvas)

    delegate_alias('scrollbarborderwidth', 'borderwidth', @h_scr, 
@v_scr)
    delegate_alias('scrollbarrelief', 'relief', @h_scr, @v_scr)

    configure(keys) unless keys.empty?
  end

  def zoom_by zf
    zf = Float(zf)
    @zoom *= zf

    vf = (1 - 1/zf) / 2

    x0, x1 = xview ;  xf = x0 + vf * (x1-x0)
    y0, y1 = yview ;  yf = y0 + vf * (y1-y0)

    scale 'all', 0, 0, zf, zf
    configure :scrollregion => bbox("all")

    xview "moveto", xf
    yview "moveto", yf
  end

  def zoom_to z
    zoom_by(z/@zoom)
  end

  def bind(ev, cb)
    if cb.class == String
      super
    else
      super(ev, proc{ |e| process_event(e, cb) })
    end
  end

  def itembind(tag, ev, cb)
    if cb.class == String
      super
    else
      super(tag, ev, proc{ |e| process_event(e, cb) })
    end
  end

  def coords(tag, *args)
    newargs = adjust_coords(@zoom, args)
    ret = super(tag, *newargs)
    return ret unless ret.class == Array
    ret.collect { |v| v / @zoom }
  end

  def move(tag, x, y)
    super(tag, x*@zoom, y*@zoom)
  end

  def create(type, *args)
    newargs = adjust_coords(@zoom, args)
    super(type, *newargs)
  end

  private

  def process_event(e, cb)
    if e.x then e.x_nonzoom=e.x/@zoom ; end
    if e.y then e.y_nonzoom=e.y/@zoom ; end
    cb.call e
  end

  def adjust_coords(mul, args)
    args.collect do |arg|
      arg.class == Array ? arg.collect { |v| v * mul } : arg
    end
  end
end

class TkcItem
  alias orig_initialize initialize

  def initialize(parent, *args)
    if parent.class == TkScrolledCanvas
      zoom = parent.zoom
      newargs = args.collect do |arg|
        arg.class == Array ? arg.collect { |v| v * zoom } : arg
      end
    else
      newargs = args
    end
    orig_initialize parent, *newargs
  end

  def bind(ev, cb)
    super(ev, proc{ |e|
            if @parent.class == TkScrolledCanvas
              zoom = @parent.zoom
              if e.x then e.x_nonzoom=e.x/zoom ; end
              if e.y then e.y_nonzoom=e.y/zoom ; end
              cb.call e
            end
          })
  end
end