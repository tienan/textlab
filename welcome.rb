# encoding:utf-8

require 'gtk2'

window=Gtk::Window.new
window.title="Instant Messager"
window.default_width=500

toolbar=Gtk::Toolbar.new
toolbar.append("Announce", nil,nil, Gtk::Image.new("add_announce.png")){
  toolbar.toolbar_style = Gtk::Toolbar::ICONS
}
toolbar.append("Add Buddy", nil,nil, Gtk::Image.new("add_buddy.png")){
  toolbar.toolbar_style = Gtk::Toolbar::ICONS
}

vbox=Gtk::VBox.new(false,0)
window.add vbox

vpaned = Gtk::VPaned.new
vpaned.set_border_width(5)

view1 = Gtk::TextView.new
buffer = view1.buffer

view2 = Gtk::TextView.new(buffer)
sw = Gtk::ScrolledWindow.new(nil, nil)
sw.set_policy(Gtk::POLICY_AUTOMATIC,Gtk::POLICY_AUTOMATIC)
vpaned.add1(sw)
sw.add(view1)

sw = Gtk::ScrolledWindow.new(nil, nil)
sw.set_policy(Gtk::POLICY_AUTOMATIC,Gtk::POLICY_AUTOMATIC)
vpaned.add2(sw)
sw.add(view2)

menubar=Gtk::MenuBar.new
menubar.append Gtk::MenuItem.new("File")
menubar.append Gtk::MenuItem.new("Edit")
menuitem=Gtk::MenuItem.new("About")
menubar.append menuitem

vbox.pack_start(menubar,true,true,0)
vbox.pack_start(toolbar, true, true, 0)
vbox.pack_start(vpaned, true, true, 0)
window.show_all
Gtk.main