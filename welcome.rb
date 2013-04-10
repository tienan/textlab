# encoding:utf-8

require 'tk'

root = TkRoot.new
root.title = "Window"

var=TkVariable.new
TkEntry.new(root){
  text var
  pack
}  
TkEntry.new(root){
  text var
  pack
}
TkButton.new(root){
  text "变色"
  pack :padx=>2,:pady=>2,:side=>'bottom'
  command{
    Tk.messageBox(
    'type'    => "ok",  
    'icon'    => "info",
    'title'   => "Title",
    'message' => var.value
    )
  }
}

#

#
#entry1 = TkEntry.new(root)
#entry2 = TkEntry.new(root) do
#  show '*'
#end
#lab1 = TkLabel.new(root){
#  text entry1.textvariable
#}  
#
#
#
#variable1 = TkVariable.new
#variable2 = TkVariable.new
#entry1.textvariable = variable1
#entry2.textvariable = variable2
#variable1.value = "Enter any text value"
#variable2.value = "Enter any confidential value"
#lab1 = TkLabel.new(root){
#  text entry1.textvariable.value
#} 
#entry1.place('height' => 25,
#            'width'  => 150,
#            'x'      => 10,
#            'y'      => 10)
#
#entry2.place('height' => 25,
#            'width'  => 150,
#            'x'      => 10,
#            'y'      => 40)
#
#lab1.place('height' => 25,
#            'width'  => 150,
#            'x'      => 10,
#            'y'      => 60)



Tk.mainloop