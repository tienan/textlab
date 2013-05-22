#encoding:utf-8
require "tk"
require "./Sample"
require "./registerWin"
require "./person_page"
require 'mongo'
include Mongo





class LoginWin
  
  def init
    #    root=TkRoot.new{
    #      title "检验科在岗操练软件"
    #    }
    
    begin
      $logiWwin.destroy
    rescue
    end
    $loginWin=TkToplevel.new
    TkLabel.new($loginWin){
      text  msg="检验科在岗操练软件"
      pack :padx=>10,:pady=>10,:side=>'top'
      font "arial 30 bold"
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'columnspan' => 3)
    }
    #    账号项
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
    #    密码项
    TkLabel.new($loginWin){
      text '密码'
      #   background "yellow"
      #   foreground "blue"
      grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>0)
    }
    cpw_entry = TkEntry.new($loginWin)do
         show '*'
    end
    pass_word=TkVariable.new  
    cpw_entry.configure(:text => pass_word)
    cpw_entry.grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>1)  
    
    
    regb = TkButton.new($loginWin) {
      #  borderwidth 10
      text '登录'
      command proc {
        coll = $db.collection("testCollection")
        result = coll.find(:name =>user_name.value,:pwd => pass_word.value)
#        p user_name.value, pass_word.value
        if result.count==1
          person = Person_page.new
          person.init(user_name)
        else
          Tk.messageBox(
    'type'    => "ok",  
    'icon'    => "info",
    'title'   => "Title",
    'message' => "密码或用户名错误"
          )
        end
      }
      grid('padx'=>10, 'pady'=>10, 'row'=>3,'column'=>0)
    }
    #object = RegisterWin.new;object.initial
    #    TkButton.new($loginWin) {
    #      #  borderwidth 10
    #      text '注册'
    #      command proc {
    #        reg = RegisterWin.new
    #        reg.initial
    #        $loginWin.destroy
    #        #    f2 = TkFrame.new(root) {
    #        #      grid('padx'=>10,'pady'=>10,'row'=>1,'column'=>0)
    #        #    }
    #        #    TkLabel.new(f2){
    #        #      text '账号'
    #        #      #   background "yellow"
    #        #      #   foreground "blue"
    #        #      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0)
    #        #    }
    #      }
    #      #  command proc {object = re}
    #      #  command proc {exit}
    #      #  load 'registerWin.rb'
    #      grid('padx'=>10, 'pady'=>10, 'row'=>3,'column'=>1,'sticky'=>'E')
    #      
    #      
    #    }
  end
end


