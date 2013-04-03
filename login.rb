#encoding:utf-8
require "tk"
require "./Sample"
require "./registerWin"
class LoginWin
  def init
    root=TkRoot.new{
      title "检验科在岗操练软件"
    }
    $loginWin=TkToplevel.new(root)
    begin
      $win.destroy
    rescue
    end
    #f2 = TkFrame.new(root) {
    #  #  borderwidth 15
    #  #  background "grey"
    ##  padx 150
    ##  pady 200
    #  grid('padx'=>10,'pady'=>10,'row'=>0,'column'=>1)
    #}
    #
    #
    #TkLabel.new(f2){
    #  text '账号'
    #  #   background "yellow"
    #  #   foreground "blue"
    #  grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0)
    #}
#    f1 = TkFrame.new($loginWin) {
#      #  borderwidth 15
#      #  background "grey"
#      #  padx 150
#      #  pady 200
#      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
#    }
    TkLabel.new($loginWin){
      text  msg="检验科在岗操练软件"
      pack :padx=>10,:pady=>10,:side=>'top'
      font "arial 30 bold"
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'columnspan' => 3)
    }
    TkLabel.new($loginWin){
      text '账号'
      #   background "yellow"
      #   foreground "blue"
      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
    }
    user_name=TkVariable.new
    TkEntry.new($loginWin){
      #  borderwidth 10
      text user_name
      grid('padx'=>10,'pady'=>10,'row'=>1,'column'=>1)
    } 
    TkLabel.new($loginWin){
      text '密码'
      #   background "yellow"
      #   foreground "blue"
      grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>0)
    }
    pass_word=TkVariable.new
    TkEntry.new($loginWin){
      text pass_word
      #  borderwidth 10
      grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>1)
    } 
    
    regb = TkButton.new($loginWin) {
      #  borderwidth 10
      text '登录'
      command {
      }
      grid('padx'=>10, 'pady'=>10, 'row'=>3,'column'=>0)
    }
    #object = RegisterWin.new;object.initial
    TkButton.new($loginWin) {
      #  borderwidth 10
      text '注册'
      command proc {
        reg = RegisterWin.new
        reg.initial
        $loginWin.destroy
        #    f2 = TkFrame.new(root) {
        #      grid('padx'=>10,'pady'=>10,'row'=>1,'column'=>0)
        #    }
        #    TkLabel.new(f2){
        #      text '账号'
        #      #   background "yellow"
        #      #   foreground "blue"
        #      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0)
        #    }
      }
      #  command proc {object = re}
      #  command proc {exit}
      #  load 'registerWin.rb'
      grid('padx'=>10, 'pady'=>10, 'row'=>3,'column'=>1,'sticky'=>'E')
      
      
    }
  end
end


