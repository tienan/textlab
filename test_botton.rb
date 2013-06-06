require 'tk'
require 'tkextlib/tile'
root = TkRoot.new()
a=[]
a[1]=TkVariable.new
a[2]=TkVariable.new
#a.value=0
TkEntry.new(root){
  text a[1]
  grid('padx'=>0, 'pady'=>0, 'row'=>0,'column'=>0,'sticky'=>'W')
}  



TkButton.new(root){
  text  "13"
  font "arial 10 bold"
  grid('padx'=>0, 'pady'=>0, 'row'=>1,'column'=>0,'sticky'=>'W')
  command proc{
  a[1].value=a[1].value.to_i+1
#    p (a.value)
  }
}
entry=TkEntry.new(root){

}

Tk.mainloop