#encoding:utf-8
require "tk"
require "./login"

root=TkRoot.new{
  title "检验科在岗操练软件"
}

TkButton.new(root){
  text '登录'
  pack('fill' => 'x')
  command {
    login = LoginWin.new
    login.init
  }
}
TkButton.new (root){
  text '注册'
  command {
    login = LoginWin.new
    login.init
  }
  pack('fill' => 'x')
}
TkButton.new (root){
  text '退出'
  command {
    exit
  }
  pack('fill' => 'x')
}
Tk.mainloop