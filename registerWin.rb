#encoding:utf-8
require "tk"

class RegisterWin
  def initial
     root=TkRoot.new{
    title "检验科在岗操练软件"
  }
    begin
      $regWin.destroy
    rescue
    end
    $regWin = TkToplevel.new
    f1 = TkFrame.new($regWin) {
      #  borderwidth 15
      #  background "grey"
      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
    }
    TkLabel.new(f1){
      text  msg="个人信息注册录入"
      pack :padx=>10,:pady=>10,:side=>'top'
      font "arial 30 bold"
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'columnspan'=> 3)
    }
    TkLabel.new(f1){
      text '账号*'
      #   background "yellow"
      #   foreground "blue"
      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
    }
    user_name=TkVariable.new
    TkEntry.new(f1){
      #  borderwidth 10
      text user_name
      grid('padx'=>10,'pady'=>10,'row'=>1,'column'=>1)
    } 
    TkLabel.new(f1){
      text '密码*'
      #   background "yellow"
      #   foreground "blue"
      grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>0)
    }
    pass_word=TkVariable.new
    TkEntry.new(f1){
      text pass_word
      #  borderwidth 10
      grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>1)
    } 
    
    TkLabel.new(f1){
      text '确认密码*'
      #   background "yellow"
      #   foreground "blue"
      grid('padx'=>10, 'pady'=>10, 'row'=>3,'column'=>0)
    }
    pass_word=TkVariable.new
    TkEntry.new(f1){
      text pass_word
      #  borderwidth 10
      grid('padx'=>10, 'pady'=>10, 'row'=>3,'column'=>1)
    } 
    
    TkButton.new(f1) {
      #  borderwidth 10
      text '注册'
      command {$win.destroy}
      grid('padx'=>10, 'pady'=>10, 'row'=>4,'column'=>0,'columnspan' => 3,'sticky'=>'EW')
      
    }
    #    Tk.mainloop
    
  end
end