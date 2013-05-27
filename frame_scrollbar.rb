require 'tk'

root = TkRoot.new { 
  title "Canvas, Grid, and Scrollbars"  
}

#f1=TkFrame.new(root){grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0)}

hbar = TkScrollbar.new(root) { orient 'horiz' }
vbar = TkScrollbar.new(root) { orient 'vert' }
#



canvas = TkCanvas.new(root) {
  width   1000
  height  400
  scrollregion '-1000 -1000 1000 1000'
  grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0)
  
}
canvas.pack

image = TkPhotoImage.new('file' => '1.gif')
t=TkcImage.new(canvas, 0, 0,'image' => image)
                         
#end of show gif code.
#code to place a label to show text
#TkLabel.new {
#  text "This is a label"
#  font TkFont.new('times 10 normal')
# }.pack
#end of code to show text

canvas.xscrollbar(hbar)
canvas.yscrollbar(vbar)
#label = TkLabel.new {grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)}
#label.image = image
# 

#TkcLine.new(canvas, 0, 0, 400, 400)
#TkcLine.new(canvas, 0, 400, 400, 0)

TkGrid.grid(canvas, vbar, 'sticky'=>'ns')
TkGrid.grid(canvas,hbar,  'sticky'=>'ew')

#TkGrid.columnconfigure(root, 0, 'weight'=>1)
#TkGrid.rowconfigure(   root, 0, 'weight'=>1)
#root.bind('Any-Key-s', proc{|e| puts e.inspect; TkcRectangle.new(canvas,
#e.x,e.y,e.x-5, e.y-5)})
#canvas.focus

Tk.mainloop

