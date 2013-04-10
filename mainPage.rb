#encoding:utf-8
require "tk"
require "./login"
require "./registerWin"

root=TkRoot.new{
  title "检验科在岗操练软件"
}

login = Proc.new {
  login = LoginWin.new
  login.init
}

register = Proc.new {
  register = RegisterWin.new
  register.initial
}

file_menu = TkMenu.new(root)

file_menu.add('command',
              'label'     => "注册",
              'command'   => register,
              'underline' => 0)
file_menu.add('command',
              'label'     => "登录",
              'command'   => login,
              'underline' => 0)

menu_bar = TkMenu.new
menu_bar.add('cascade',
             'menu'  => file_menu,
             'label' => "基本操作")

root.menu(menu_bar)

Tk.mainloop



#TkButton.new(root){
#  text '登录'
#  pack('fill' => 'x')
#  command {
#    login = LoginWin.new
#    login.init
#  }
#}
#TkButton.new (root){
#  text '注册'
#  command {
#    login = LoginWin.new
#    login.init
#  }
#  pack('fill' => 'x')
#}
#TkButton.new (root){
#  text '退出'
#  command {
#    exit
#  }
#  pack('fill' => 'x')
#}
#Tk.mainloop