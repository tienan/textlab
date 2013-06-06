require 'tk'
root=TkRoot.new{title "Le Gros SA"}

canvas = TkCanvas.new(root) {
  width   1000
  height  600
  scrollregion '0 -400  800 800' 
}
file = "D:\\workspace\\textlab_1\\img\\test_1\\0.gif"
image = TkPhotoImage.new('file' => file)
t=TkcImage.new(canvas, 100, 100,'image' => image)
#hbar = TkScrollbar.new(root) { orient 'horiz' }
#vbar = TkScrollbar.new(root) { orient 'vert' }
#canvas.xscrollbar(hbar)
#canvas.yscrollbar(vbar)
#TkGrid.grid(canvas, vbar,'sticky'=>'NS')
#TkGrid.grid(canvas,hbar,'sticky'=>'WE')


menuline=TkFrame.new(root)
menuline.pack("side"=>"top")
TkMenubutton.new(menuline) { |mb|
  text "Zoom"
  underline 0
  menu TkMenu.new(mb) {
    add 'command', 'label' => 'Zoom in',
        'underline' => 0,
     'command' => proc { p "in"; }  
    add 'command', 'label' => 'Zoom out',
        'underline' => 0,
     'command' => proc { p "out" }    
  }
  pack('side' => 'top', 'padx' => '1m')
}

canvas.pack
canvas.focus
root.bind('Any-Key-s',  proc{|e| TkcRectangle.new(canvas, e.x,e.y,e.x-5, e.y-5)})
Tk.mainloop