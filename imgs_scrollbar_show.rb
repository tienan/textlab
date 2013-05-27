require 'tk'

Tk.root.title("Test")
f1 = TkFrame.new(root)


count=-1
Dir.foreach(directory_path) do |file|
  if file.include? ".jpg"

canvas = TkCanvas.new(Tk.root) {
    width   320
    height  200
    scrollregion '0 0 400 400'
    pack(:side => :left, :fill => :both, :expand => :true )
}

vbar = TkScrollbar.new(Tk.root) {
    orient 'vert'
    pack(:side => :right, :fill => :y)
    }

canvas.yscrollbar(vbar)

frame = TkFrame.new(canvas) do |frm|
    (1..10).each do |i|
       TkButton.new(frm) {
          text i
          command { Tk.bell }
          grid
       }
    end
end

TkcLine.new(canvas, 0, 0, 400, 400)
TkcLine.new(canvas, 0, 400, 400, 0)
TkcWindow.new(canvas, 200,
200, :width=>100, :height=>280, :window=>frame)

Tk.mainloop