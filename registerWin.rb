#encoding:utf-8
require "tk"
require 'mongo'
include Mongo

class RegisterWin
  def initial
#    root=TkRoot.new{
#      title "检验科在岗操练软件"
#    }
    begin
      $regWin.destroy
    rescue
    end
    $regWin = TkToplevel.new
    f1 = TkFrame.new($regWin) {
      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
    }
    #    个人注册信息容器
    TkLabel.new(f1){
      text  msg="个人信息注册录入"
      pack :padx=>10,:pady=>10,:side=>'top'
      font "arial 30 bold"
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'columnspan'=> 3)
    }
    #    账号项
    TkLabel.new(f1){
      text '账号*'
      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
    }
    user_name=TkVariable.new
    TkEntry.new(f1){
      text user_name
      grid('padx'=>10,'pady'=>10,'row'=>1,'column'=>1)
    } 
    #    密码项
    TkLabel.new(f1){
      text '密码*'
      grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>0)
    }
    pass_word=TkVariable.new  
    pw_entry =  TkEntry.new(f1)do 
    show '*'
  end
  #    {
  #      text pass_word
  #      grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>1)
  #    } 
  pw_entry.configure(:text => pass_word)
  pw_entry.grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>1)
  #   确认密码项  
  TkLabel.new(f1){
    text '确认密码*'
    grid('padx'=>10, 'pady'=>10, 'row'=>3,'column'=>0)
  }
  pass_word_comfirm=TkVariable.new
  cpw_entry = TkEntry.new(f1) do 
    show '*'
  end
  cpw_entry.configure(:text => pass_word_comfirm)
  cpw_entry.grid('padx'=>10, 'pady'=>10, 'row'=>3,'column'=>1)   
  #  注册按键
  TkButton.new(f1) {
    text '注册'
    success_reg = "你的用户名是:"+ user_name.value + "密码是:"+ cpw_entry.value
    command {
      if cpw_entry.value == pw_entry.value
        begin 
          coll = $db.collection("testCollection")
          doc = {"name" => user_name.value, "pwd" => cpw_entry.value}
          coll.insert(doc)
#          coll.remove
          Tk.messageBox(
    'type'    => "ok",  
    'icon'    => "info",
    'title'   => "Title",
    'message' => "你的用户名是:"+ user_name.value + ",密码是:"+ cpw_entry.value 
          )
          $regWin.destroy
          rescue => ex
          Tk.messageBox(
    'type'    => "ok",  
    'icon'    => "info",
    'title'   => "Title",
    'message' => "你的用户名是:"+ user_name.value + "已经存在，请更换" 
          )
        end
        
      else
        Tk.messageBox(
    'type'    => "ok",  
    'icon'    => "info",
    'title'   => "Title",
    'message' => "两次输入的密码不符"
        )
      end
      
    }
    grid('padx'=>10, 'pady'=>10, 'row'=>4,'column'=>0,'columnspan' => 3,'sticky'=>'EW')
    
  }    
end
end
