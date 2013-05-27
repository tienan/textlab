require 'tk'

root=Tk.root.title("Test")
f1 = TkFrame.new(root){
  grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>3)
}

f2 = TkFrame.new(root){
  grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>3)
}
TkLabel.new(f2){
  text '密码'
  #   background "yellow"
  #   foreground "blue"
  grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>0)
}


canvas = TkCanvas.new(f1) {
  width   920
  height  400
  scrollregion '-500 -500 500 500'
  grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>3)
}



vbar = TkScrollbar.new(f1) {
  orient 'vert'
  grid('padx'=>0, 'pady'=>0, 'row'=>0,'column'=>0,'rowspan'=>20,'sticky'=>'NS')
}
hbar = TkScrollbar.new(f1) {
  orient 'horiz'
  grid('padx'=>0, 'pady'=>0, 'row'=>20,'column'=>0,'columnspan'=>20,'sticky'=>'EW')
}

canvas.yscrollbar(vbar)
canvas.xscrollbar(hbar)

#TkGrid.grid(canvas, vbar, 'sticky'=>'ns')
#TkGrid.grid(canvas,hbar,  'sticky'=>'ew')
#          image.file=  "D:\\workspace\\textlab_1\\img\\test_1\\_modify0.gif"
#          label = TkLabel.new(frm) {grid('padx'=>10, 'pady'=>10, 'row'=>position_x,'column'=>position_y)}
#          label.image = image
img_path = 'D:\\workspace\\textlab_1\\img\\test_1\\'
pos = 0
frame = TkFrame.new(canvas) do|frm|
Dir.foreach(img_path) do |file|
  
  #  label = TkLabel.new(frm) {grid('padx'=>10, 'pady'=>10, 'row'=>position_x,'column'=>position_y)}
  #  label.image = image
  
  if file.include? "modify"
    position_x = pos/4
    position_y = pos%4
    image = TkPhotoImage.new
    image.file=  img_path+file
    p img_path+file
    b = TkButton.new(frm) {
      image image
      command { Tk.bell }
      grid('padx'=>10, 'pady'=>10, 'row'=>1+position_x,'column'=>position_y)
    }
    pos=pos+1
  end
end
end
#TkcLine.new(canvas, 0, 10, 0, 10000)
#TkcLine.new(canvas, 0, 10, 900, 100000)
TkcWindow.new(canvas, 0,
              0, :window=>frame)
 s = Tk::Tile::Scale.new(f1) {orient 'horizontal'; length 200; from 1.0; to 100.0;grid}
Tk.mainloop