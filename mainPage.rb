#encoding:utf-8
require "tk"
require "./login"
require "./registerWin"
require "./person_page"

$db = MongoClient.new("localhost", 27017).db("mydb")

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

person = Proc.new{
  person = Person_page.new
  person.init("test")
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
#file_menu.add('command',
#              'label'     => "个人情况",
#              'command'   => person,
#              'underline' => 0)

menu_bar = TkMenu.new
menu_bar.add('cascade',
             'menu'  => file_menu,
             'label' => "基本操作")

root.menu(menu_bar)

instruction = ["使用说明:","首次使用请注册您的用户名","1. 点击  左上角 \"基本操作\"后，选择 注 册 项目","2. 根据弹出窗口的提示进行后续操作","3. 注册完成后，选择 \"登录\"项目，进入个人主页"]

length = instruction.size  

length.times do |t|
  TkLabel.new(root){
    text  instruction[t]
    grid('padx'=>10, 'row'=>t,'column'=>0,'sticky'=>"W")
    font "arial 10"
    foreground "red"
  }
end


#instruction = TkLabel.new(root){
#  text "使用说明:"
#  grid('padx'=>10, 'row'=>0,'column'=>0,'sticky'=>"W")
#  font "arial 10"
#}
#content = TkLabel.new(root){
#  text "首次使用请注册您的用户名" 
#  grid('padx'=>10, 'row'=>1,'column'=>0,'sticky'=>"W")
#  font "arial 10"
#}
#TkLabel.new(root){
#  text "1. 点击  左上角 \"基本操作\"后，选择 注 册 项目 " 
#  grid('padx'=>10, 'row'=>2,'column'=>0,'sticky'=>"W")
#  font "arial 10"
#}
#TkLabel.new(root){
#  text "2.  据弹出窗口的提示进行后续操作"
#  grid('padx'=>10, 'row'=>3,'column'=>0,'sticky'=>"W")
#  font "arial 10"
#}
#
#TkLabel.new(root){
#  text "2.  据弹出窗口的提示进行后续操作"
#  grid('padx'=>10, 'row'=>3,'column'=>0,'sticky'=>"W")
#  font "arial 10"
#}
#TkLabel.new(root){
#  text "2.  据弹出窗口的提示进行后续操作"
#  grid('padx'=>10, 'row'=>3,'column'=>0,'sticky'=>"W")
#  font "arial 10"
#}



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







#
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


