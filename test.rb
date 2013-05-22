#encoding:utf-8
require 'rubygems'
require 'mongo'
require 'tk'
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

#root=TkRoot.new{
#  title "检验科在岗操练软件"
#}
#directory_path='F:\\img\\test\\'
#image = TkPhotoImage.new
#Dir.foreach(directory_path)  do |file|
#  if file!="." and file!=".."
#    puts  directory_path + file
##    image.file =  directory_path + file
##    label = TkLabel.new(root) 
##    label.image = image
##    label.place('height' => image.height, 
##            'width' => image.width, 
##            'x' => 10, 'y' => 10)
#  end
#end
##Tk.mainloop

$resultsVar = TkVariable.new
root = TkRoot.new
root.title = "Window"

image = TkPhotoImage.new(:file => 'F:\\img\\test\\figure(1).gif')
#image.file = "F:\\img\\test\\figure(17).jpg"

label = TkLabel.new(root) 
label.image = image
label.place('height' => image.height, 
            'width' => image.width, 
            'x' => 10, 'y' => 10)
Tk.mainloop