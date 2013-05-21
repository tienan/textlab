#encoding:utf-8
require "tk"

class Person_page
  
  attr_accessor :name
  attr_reader :name
  def init(name)
    begin
      $person_page.destroy
    rescue
    end
    @name = name   
    $person_page=TkToplevel.new
    TkLabel.new($person_page){
      text  msg= name + " 的主页 "
      pack :padx=>10,:pady=>10,:side=>'top'
      font "arial 10 bold"
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'columnspan' => 3)
    }
  end
  
end


