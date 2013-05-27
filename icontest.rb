require 'tk'
root = TkRoot.new
menu = TkMenu.new(root)
%w(One Two Three).each {|i| menu.add :command, :label => i}
if Tk.windowingsystem == 'aqua'
    root.bind '2', proc{|x,y| menu.popup(x,y)}, "%X %Y"
    root.bind 'Control-1', proc{|x,y| menu.popup(x,y)}, "%X %Y"
else
    root.bind '3', proc{|x,y| menu.popup(x,y)}, "%X %Y"
end
Tk.mainloop