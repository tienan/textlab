require 'tk'

class Draw
#  color = 'red'
  def do_press(x, y,color)
    @start_x = x
    @start_y = y
    @current_line =TkcRectangle.new(@canvas, x, y, x,y,
                         'width' => 1,'outline'=> color)
  end
  def do_motion(x, y)
    if @current_line
      @current_line.coords @start_x, @start_y, x, y
    end
  end
  def do_release(x, y)
    if @current_line
      @current_line.coords @start_x, @start_y, x, y
#      @current_line.fill 'black'
      @current_line = nil
      p x,y
    end
  end
  def initialize(parent,color)
    @canvas = TkCanvas.new(parent)
    @canvas.pack
    @start_x = @start_y = 0
    @canvas.bind("1", proc{|e| do_press(e.x, e.y,color);p e.x,e.y})
    #    @canvas.bind("2", proc{ puts @canvas.postscript({}) })
    @canvas.bind("B1-Motion", proc{|x, y| do_motion(x, y)}, "%x %y")
    @canvas.bind("ButtonRelease-1", proc{|x, y| do_release(x, y)}, "%x %y")
  end
end
color = 'whte'
root = TkRoot.new{ title 'Canvas' }
Draw.new(root,color)
Tk.mainloop