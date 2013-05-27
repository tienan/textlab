require 'RMagick' 
require 'tk'
include Magick  
pic = ImageList.new("F:\\img\\test\\figure(3).jpg")
pic = pic.thumbnail(pic.columns*0.09, pic.rows*0.09)
pic.write("tmp.gif")
root = TkRoot.new{"view"}
image = TkPhotoImage.new
image.file = 'tmp.gif'
label = TkLabel.new(root) {
  grid('padx'=>10, 'pady'=>10, 'row'=>3,'column'=>0,'columnspan'=>"20")
}
label.image = image
label.place('height' => image.height, 
            'width' => image.width, 
            'x' => 10, 'y' => 10)
Tk.mainloop

##l = pic.columns > pic.rows ?
## pic.columns : pic.rows  
##f = 128.0/l;  
##thumb = pic.thumbnail(f)  
##thumb.write("vd2_tb.png")
#require 'RMagick'
#
# cat = ImageList.new("F:\\img\\test\\figure(3).jpg")
# cat.write("1.jpg")
#exit

#要求ruby1.8.x
#require 'Win32API'
#require 'tkextlib/tkimg'
##定义API GetCursorPos和SetCursorPos的接口
#get_cursor_pos = Win32API.new("user32","GetCursorPos",['p'],'v')
#$set_cursor_pos = Win32API.new("user32","SetCursorPos",['i']*2,'v')
#
##获取鼠标位置
#lpPoint =" " * 8    #初始化存储位置信息的变量
#get_cursor_pos.Call(lpPoint)        #调用API
#x, y = lpPoint.unpack("LL")        #将传回的参数转换为两个无符号的长整数
#puts "当前鼠标的坐标为： #{x}, #{y}"
#
##设置鼠标位置
#def setm(new_xy)
#  $set_cursor_pos.Call(new_xy[0], new_xy[1])
#end
#
#100.times{
#  setm([rand*800,rand*600])
#  sleep 0.01
#}
