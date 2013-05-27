require 'RMagick' 
 require 'tk'
include Magick
# require 'tk'
# img_path = 'D:\\workspace\\textlab_1\\img\\test_1\\'
# Dir.foreach(img_path) do |file|
#   if file.include? '.gif'
#     p img_path+file
#     pic = ImageList.new(img_path+file)
#     pic = pic.thumbnail(pic.columns*0.09, pic.rows*0.09)
#     pic.write(img_path+"_modify"+file)
#   end
# end

#require 'tk'

# Common packing options...
Top  = { 'side' => 'top', 'padx'=>5, 'pady'=>5 }
Left = { 'side' => 'left', 'padx'=>5, 'pady'=>5 }
Bottom = { 'side' => 'bottom', 'padx'=>5, 'pady'=>5 }

temp = 74   # Starting temperature...

root = TkRoot.new { title "Thermostat" }

top = TkFrame.new(root) { background "#606060" }
bottom = TkFrame.new(root)

tlab = TkLabel.new(top) do
text temp.to_s
font "{Arial} 54 {bold}"
foreground "green"
background "#606060"
pack Left
end

TkLabel.new(top) do         # the "degree" symbol
text "o"
font "{Arial} 14 {bold}"
foreground "green"
background "#606060"
# Add anchor-north to the hash (make a superscript)
pack Left.update({ 'anchor' => 'n' })
end

TkButton.new(bottom) do
text " Up "
command proc { tlab.configure("text"=>(temp+=1).to_s) }
pack Left
end

TkButton.new(bottom) do
text "Down"
command proc { tlab.configure("text"=>(temp-=1).to_s) }
pack Left
end

top.pack Top
bottom.pack Bottom

Tk.mainloop