#encoding:utf-8
require 'RMagick' 
require 'tk'
require "./magic_show"
include Magick
class Case_page
  def init1
    self.init(@img_path)
  end
  def init(img_path)
    begin
      $case_page.destroy
    rescue
    end
    img_path = 'D:\\workspace\\textlab_1\\img\\test_1\\'
    @img_path = img_path
    image = TkPhotoImage.new
    $case_page = TkToplevel.new
    f1 = TkFrame.new($case_page) {
      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
    }
    TkLabel.new($case_page){
      text  msg="尿沉渣检验项"
      pack :padx=>10,:pady=>10,:side=>'top'
      font "arial 30 bold"
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'columnspan' => 8)
    }
    
    label_set = ['尿液中白细胞数量（个）','尿液中红细胞数量（个）','尿液中上皮细胞数量（个）','尿液中颗粒管型数量（个）','尿液中透明管型（个）','尿液中毒菌数量（个）','尿液中细胞管型数量（个）']
    label_value = []
    tmp=TkVariable.new
    len = label_set.size
    len.times do |t|
      TkLabel.new(f1){
        text  msg= label_set[t]
        pack :padx=>10,:pady=>10,:side=>'top'
        font "arial 10 bold"
        grid('padx'=>10, 'pady'=>10, 'row'=>t+1,'column'=>0)
      }
      TkEntry.new(f1){
        text label_value[t]
        grid('padx'=>10,'pady'=>10,'row'=>t+1,'column'=>1)
      }
#      label_value[t]=tmp.value
    end
    
    submit_b = TkButton.new(f1) {
      #  borderwidth 10
      text '提交'
      command proc {
        
      }
      grid('padx'=>10, 'pady'=>10, 'row'=>len+2,'column'=>0)
    }
    
    back_b = TkButton.new(f1) {
      text '返回个人页面'
      command proc {
        
      }
      grid('padx'=>10, 'pady'=>10, 'row'=>len+2,'column'=>1)
    }
    img_show = TkFrame.new($case_page) {
      grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>2,'rowspan'=>"20")
    }
    img_contain = TkFrame.new($case_page) {
      grid('padx'=>10, 'pady'=>10, 'row'=>len+3,'column'=>0,'columnspan'=>"20")
    }
    
    
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify0.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0)}
    label.image = image
    b = TkButton.new(img_show) {
      image    image
      command  proc { 
      ms = Magic_show.new
        ms.init('D:\\workspace\\textlab_1\\img\\test_1\\6.gif') 
        }
      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0)
    }
    b.bind("Enter") { puts "change" }
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify1.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)}
    label.image = image
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify2.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>0)}
    label.image = image
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify3.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>1)}
    label.image = image
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify4.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>1)}
    label.image = image
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify5.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>1)}
    label.image = image
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify6.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>2)}
    label.image = image
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify7.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>2)}
    label.image = image
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify8.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>2)}
    label.image = image
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify9.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>3)}
    label.image = image
    
    image = TkPhotoImage.new
    image.file="D:\\workspace\\textlab_1\\img\\test_1\\_modify10.gif"
    label = TkLabel.new( img_show) {grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>3)}
    label.image = image
    #    count=-1
    #    p count
    #    p img_path
    #    Dir.foreach(img_path) do |file|
    #      if file.include? ".gif"
    #        count=count+1  
    #        puts  img_path + file
    #        pic = ImageList.new(img_path+file)
    #        pic = pic.thumbnail(pic.columns*0.09, pic.rows*0.09)
    #        pic.write("tmp.gif")
    #        image = TkPhotoImage.new
    #        image.file="tmp.gif"
    #        label = TkLabel.new( img_contain) {grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>count)}
    #        label.image = image
    #      end
    #    end
    
    
    
    #    TkLabel.new(img_contain){
    #      text  msg="个人信息注册录入"
    #      pack :padx=>10,:pady=>10,:side=>'top'
    #      font "arial 30 bold"
    #      grid('padx'=>10, 'pady'=>10, 'row'=>0,'column'=>0,'columnspan'=> 3)
    #    }
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