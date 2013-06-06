require "tk"
require 'tkextlib/tile'
require 'RMagick'
class Magic_show
  size_zoom=0.1
  
  def init(file)
    scale_factor=0.5
    begin
      $show.destroy
    rescue
    end
    $show=TkToplevel.new($case_page)
    f_button=TkFrame.new($show){
      grid('padx'=>0, 'pady'=>0, 'row'=>0,'column'=>0,'sticky'=>'W')
      
    }
    label_set = ['白细胞数量','红细胞数量','上皮细胞数量','颗粒管型数量','透明管型','毒菌数量','细胞管型数量']
    label_value = []
    len=label_set.size
    len.times do |t|
      label_value[t]=TkVariable.new
      #      label_value[t].value=0;
    end
    open_image = TkPhotoImage.new
    open_image.file="D:\\workspace\\textlab_1\\img\\open.gif"
    back_image = TkPhotoImage.new
    back_image.file="D:\\workspace\\textlab_1\\img\\back.gif"
    forward_image = TkPhotoImage.new
    forward_image.file="D:\\workspace\\textlab_1\\img\\forward.gif"
    button_label_set = ['白细胞','红细胞','上皮细胞','颗粒管型','透明管型','毒菌','细胞管型']
    
    TkButton.new( f_button){
      image open_image
      grid('padx'=>0, 'pady'=>0, 'row'=>0,'column'=>0,'sticky'=>'W')
    }
    TkButton.new( f_button){
      image back_image
      grid('padx'=>0, 'pady'=>0, 'row'=>0,'column'=>1,'sticky'=>'W')
    }
    
    TkButton.new( f_button){
      image  forward_image
      grid('padx'=>0, 'pady'=>0, 'row'=>0,'column'=>2,'sticky'=>'W')
    }
    
    #    
    
    len.times do |t|
      TkButton.new( f_button){
        text  button_label_set[t]
        font "arial 10 bold"
        grid('padx'=>0, 'pady'=>0, 'row'=>0,'column'=>t+3,'sticky'=>'W')
        command proc{
          label_value[t].value = label_value[t].value.to_i+1
          p label_value[t].value
          p 1
        }
      }
    end
    f1=TkFrame.new($show){grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)}
    f_input = TkFrame.new($show){
      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>1)
      width=10
    }
    TkLabel.new(f_input){
      text  msg="已经标注的："
      font "arial 10 bold"
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'sticky'=>'W')
    }
    len = label_set.size
    len.times do |t|
      TkLabel.new(f_input){
        text  msg= label_set[t]
        pack :padx=>10,:pady=>10,:side=>'top'
        font "arial 10 bold"
        grid('padx'=>10, 'pady'=>10, 'row'=>t+1,'column'=>0,'sticky'=>'W')
      }
      
      TkEntry.new(f_input){
        text label_value[t]
        width 3
        grid('padx'=>10,'pady'=>10,'row'=>t+1,'column'=>1,'sticky'=>'W')
        
      }
      #      label_value[t]=tmp.value
    end
    
    
    #    hbar = TkScrollbar.new(f1) { orient 'horiz' }
    #    vbar = TkScrollbar.new(f1) { orient 'vert' }
    #
    
    
    
    canvas = TkCanvas.new(f1) {
      width   900
      height  600
      #      scrollregion '-800 -400 800 800'
      pack
      
    }
    
    
    
    tmp_file = Magick::Image.read(file).first
    tmp_file = tmp_file.resize(scale_factor)
    #    p tmp_file[:width],tmp_file[:height]
    tmp_file.write('./img/tmp.gif')
    #    file = './image/tmp.gif'
    
    
    image = TkPhotoImage.new('file' => './img/tmp.gif')
    t=TkcImage.new(canvas,500, 300,'image' => image)
    
    #end of show gif code.
    #code to place a label to show text
    #TkLabel.new {
    #  text "This is a label"
    #  font TkFont.new('times 10 normal')
    # }.pack
    #end of code to show text
    
    #    canvas.xscrollbar(hbar)
    #    canvas.yscrollbar(vbar)
    #label = TkLabel.new {grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)}
    #label.image = image
    # 
    
    #TkcLine.new(canvas, 0, 0, 400, 400)
    #TkcLine.new(canvas, 0, 400, 400, 0)
    
    #    TkGrid.grid(canvas, vbar,'sticky'=>'NS')
    #    TkGrid.grid(canvas,hbar,'sticky'=>'WE')
    #    canvas.bind('1',  proc{|e| p "#{e.x}, #{e.y}";
    #           TkcRectangle.new(canvas, e.x,e.y,e.x+10, e.y+10)})
    #    canvas.bind('Any-Key-d',  proc{|e| p "#{e.x}, #{e.y}"; 
    #           TkcRectangle.new(canvas, e.x,e.y,e.x+10, e.y+10)})
    
    
    #TkGrid.columnconfigure(root, 0, 'weight'=>1)
    #TkGrid.rowconfigure(   root, 0, 'weight'=>1)
    
    #  TkcWindow.new(img_canvas, 300,300, :window=>canvas)  
    #root.bind('Any-Key-s', proc{|e| puts e.inspect; TkcRectangle.new(canvas,
    #e.x,e.y,e.x-5, e.y-5)})
    #canvas.focus
    
    #    Tk.mainloop
    canvas.bind('1',  proc{|e| p "#{e.x}, #{e.y}";
      TkcRectangle.new(canvas, e.x,e.y,e.x+10, e.y+10)})
    canvas.focus
    
    
    file_menu = TkMenu.new($show)
    view = TkMenu.new($show)
    annotation = TkMenu.new($show)
    savemode = TkMenu.new($show)
    switchlist = TkMenu.new($show)
    showbycell = TkMenu.new($show)
    
    
    file_menu.add('command',
              'label'     => "New...",
              'command'   => {},
              'underline' => 0)
    file_menu.add('command',
              'label'     => "Open...",
              'command'   =>  {},
              'underline' => 0)
    file_menu.add('command',
              'label'     => "Close",
              'command'   =>  {},
              'underline' => 0)
    file_menu.add('separator')
    file_menu.add('command',
              'label'     => "Save",
              'command'   =>  {},
              'underline' => 0)
    file_menu.add('command',
              'label'     => "Save As...",
              'command'   =>  {},
              'underline' => 5)
    file_menu.add('separator')
    file_menu.add('command',
              'label'     => "Exit",
              'command'   =>  {},
              'underline' => 3)
    
    menu_bar = TkMenu.new
    menu_bar.add('cascade',
             'menu'  => file_menu,
             'label' => "File")
    #    
    menu_bar.add('cascade',
             'menu'  => view,
             'label' => "View")
    menu_bar.add('cascade',
             'menu'  => annotation,
             'label' => "Annotation")
    menu_bar.add('cascade',
             'menu'  => savemode,
             'label' => "SaveMode")
    menu_bar.add('cascade',
             'menu'  => switchlist,
             'label' => "SwitchList")
    menu_bar.add('cascade',
             'menu'  => showbycell,
             'label' => "ShowbyCell")
    
    $show.menu(menu_bar)
    
    #
    #    TkGrid.columnconfigure($show, 0, :weight => 1 )
    #    TkGrid.rowconfigure( $show, 0, :weight => 1 )
    #    
    #    canvas.bind( "1", proc{|x,y| lastx = canvas.canvasx(x); lasty = canvas.canvasy(y)}, "%x %y")
    #    canvas.bind( "B1-Motion", proc{|x, y| addLine(canvas.canvasx(x), canvas.canvasy(y))}, "%x %y")
    #    canvas.bind( "B1-ButtonRelease", proc{doneStroke})
    #    
    #    r = TkcRectangle.new( canvas, 10, 10, 30, 30, :fill => 'red', :tags => 'palette palettered')
    #    r.bind( "1", proc {setColor('red')})
    #    
    #    r = TkcRectangle.new( canvas, 10, 35, 30, 55, :fill => 'blue', :tags => 'palette paletteblue')
    #    r.bind( "1", proc {setColor('blue')})
    #    
    #    r = TkcRectangle.new( canvas, 10, 60, 30, 80, :fill => 'black', :tags => 'palette paletteblack paletteSelected')
    #    r.bind( "1", proc {setColor('black')})
    #    #
    #    canvas.itemconfigure 'palette', :width => 5
    #    
    #    def setColor color
    #      color = color
    #      canvas.dtag 'all', 'paletteSelected'
    #      canvas.itemconfigure 'palette', :outline => 'white'
    #      canvas.addtag 'paletteSelected', :withtag, "palette#{color}"
    #      canvas.itemconfigure 'paletteSelected', :outline => '#999999'
    #    end
    #    
    #    setColor 'black'
    #    
    #    def addLine (x,y)
    #      TkcLine.new( canvas, lastx, lasty, x, y, :fill => color, :width => 5, :tags => 'currentline' )
    #      lastx = x; lasty = y;
    #    end
    #    def doneStroke
    #      canvas.itemconfigure 'currentline', :width => 1
    #    end
    #    
  end
end


#ms = Magic_show.new
#ms.init('D:\\workspace\\textlab_1\\img\\test_1\\0.gif')


