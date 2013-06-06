require 'tk'
root=TkRoot.new{title "Bug or Feature or Misunderstanding?"}
f1 = TkFrame.new($case_page) {
  grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
}
f2 = TkFrame.new($case_page) {
  grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>0)
}

label_set = ['白细胞数量','红细胞数量','上皮细胞数量','颗粒管型数量','透明管型','毒菌数量','细胞管型数量']
label_value = []
len=label_set.size
len.times do |t|
  label_value[t]=TkVariable.new
  #      label_value[t].value=0;
end

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
      end

canvas = TkCanvas.new(f1) {
  width   1000
  height  600
  scrollregion '0 0 800 800'
  pack('fill' => 'both', 'expand'=>true)
  
}
hbar = TkScrollbar.new(f1) { orient 'horiz' }
vbar = TkScrollbar.new(f1) { orient 'vert' }
file = "D:\\workspace\\textlab_1\\img\\test_1\\0.gif"
image = TkPhotoImage.new('file' => file)
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

TkGrid.grid(canvas, vbar,'sticky'=>'NS')
TkGrid.grid(canvas,hbar,'sticky'=>'WE')


canvas.bind('1',  proc{|e| p "#{e.x}, #{e.y}";
  TkcRectangle.new(canvas, e.x,e.y,e.x+10, e.y+10)})
root.bind('Any-Key-d',  proc{|e| p "#{e.x}, #{e.y}"; 
  TkcRectangle.new(canvas, e.x,e.y,e.x-5, e.y-5)})
Tk.mainloop