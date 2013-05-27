require 'tk'

msg="你好！中国"
root=TkRoot.new{title msg}
label_msg=TkLabel.new(root){
  text  msg
  pack :padx=>2,:pady=>2,:side=>'top'
  font "arial 20 bold"
}
  
b=TkButton.new(root){
  text "变色"
  pack :padx=>2,:pady=>2,:side=>'bottom'
}
  
b.bind("Enter"){label_msg.configure('foreground'=>'red')}
b.bind("Leave"){label_msg.configure('foreground'=>'black')}

Tk.mainloop
    