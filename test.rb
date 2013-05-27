#encoding:utf-8
require 'rubygems'
require 'mongo'
require 'tk'
require 'RMagick' 
include Magick
#require 'tkextlib/tkimg'
#
#include Mongo
#
#client = MongoClient.new('localhost', 27017)
#db     = client['sample-db']
#coll   = db['test']
#
#coll.remove
#
#
#
#3.times do |i|
#   doc = {"name" => i, "pwd" => "222", "case" => [1,2,3,4,6,7]}
#   coll.insert(doc)
#end
#a = []
#puts "There are #{coll.count} records. Here they are:"
#coll.find.each { |doc| a =  doc['case']}
#puts a[1]

root=TkRoot.new{
  title "检验科在岗操练软件"
}
f1 = TkFrame.new($regWin) {
  grid('padx'=>10, 'pady'=>10, 'row'=>1,'column'=>0)
}
directory_path='F:\\img\\test\\'
count=-1
Dir.foreach(directory_path) do |file|
  if file.include? ".jpg"
    count=count+1  
#    puts  directory_path
    pic = ImageList.new(directory_path+file)
    pic = pic.thumbnail(pic.columns*0.09, pic.rows*0.09)
    pic.write("tmp.gif")
    image = TkPhotoImage.new
    image.file="tmp.gif"
    label = TkLabel.new(f1) {grid('padx'=>10, 'pady'=>10, 'row'=>2,'column'=>count)}
    label.image = image
    #    label.place('height' => image.height, 
    #            'width' => image.width, 
    #            'x' => 10, 'y' => 10)
    #    image.file =  directory_path + file
    #    label = TkLabel.new(root) 
    #    label.image = image
    #    label.place('height' => image.height, 
    #            'width' => image.width, 
    #            'x' => 10, 'y' => 10)
  end
end
Tk.mainloop

#$resultsVar = TkVariable.new
#root = TkRoot.new
#root.title = "Window"
#pic = ImageList.new("F:\\img\\test\\figure(3).jpg")
#pic = pic.thumbnail(pic.columns*0.09, pic.rows*0.09)
#pic.write("tmp1.gif")
#image = TkPhotoImage.new(:file => 'tmp1.gif')
##image.file = "F:\\img\\test\\figure(17).jpg"
#
#label = TkLabel.new(root) 
#label.image = image
#label.place('height' => image.height, 
#            'width' => image.width, 
#            'x' => 10, 'y' => 10)
#Tk.mainloop