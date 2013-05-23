#encoding:utf-8
require "tk"
class Case_page
  def init1
    self.init(@img_path)
  end
  def init(img_path)
    begin
      $case_page.destroy
    rescue
  end
  img_path = 'F:\\img\\test\\'
  @img_path = img_path
  image = TkPhotoImage.new
    $case_page = TkToplevel.new
    TkLabel.new($case_page){
      text  msg="尿沉渣检验项"
      pack :padx=>10,:pady=>10,:side=>'top'
      font "arial 30 bold"
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'columnspan' => 8)
    }
    
    label_set = ['尿液颜色','尿液透明度','尿液中白细胞数量（个）','尿液中红细胞数量（个）','尿液中上皮细胞数量（个）','尿液中颗粒管型数量（个）','尿液中透明管型（个）','尿液中毒菌数量（个）','尿液中细胞管型数量（个）']
    label_value = []
    tmp=TkVariable.new
    len = label_set.size
    len.times do |t|
      TkLabel.new($case_page){
        text  msg= label_set[t]
        pack :padx=>10,:pady=>10,:side=>'top'
        font "arial 10 bold"
        grid('padx'=>10, 'pady'=>10, 'row'=>t+1,'column'=>0)
      }
      TkEntry.new($case_page){
        text tmp
        grid('padx'=>10,'pady'=>10,'row'=>t+1,'column'=>1)
      }
      label_value[t]=tmp.value
    end
    
    img_show = TkFrame.new($case_page) {
      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>2,'rowspan'=>"20")
    }
    img_contain = TkFrame.new($case_page) {
      grid('padx'=>10, 'pady'=>10, 'row'=>len+2,'column'=>0,'columnspan'=>"20")
    }
    Dir.foreach(img_path)  do |file|
    if file!="." and file!=".."
      image = img_path + file
    end
    end
    TkLabel.new(img_contain){
      text  msg="个人信息注册录入"
      pack :padx=>10,:pady=>10,:side=>'top'
      font "arial 30 bold"
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'columnspan'=> 3)
    }
    #      
    #      #    透明度
    #      TkLabel.new($case_page){
    #        text  msg="尿液透明度"
    #        pack :padx=>10,:pady=>10,:side=>'top'
    #        font "arial 10 bold"
    #        grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
    #      }
    #      urine_color=TkVariable.new
    #      TkEntry.new($case_page){
    #        text urine_color
    #        grid('padx'=>10,'pady'=>10,'row'=>1,'column'=>1)
    #      } 
  end
end
root=TkRoot.new{
  title "检验科在岗操练软件"
}

case_1 = Case_page.new
case_1.init1
Tk.mainloop