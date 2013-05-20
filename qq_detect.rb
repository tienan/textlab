#!/usr/bin/ruby
# coding: utf-8

require 'rubygems'
require 'mechanize'

num = '38093973' #我的QQ

def online (num)
agent = Mechanize.new
agent.user_agent_alias = 'Linux Mozilla'
agent.max_history = 1
agent.open_timeout = 10
url = 'http://webpresence.qq.com/getonline?Type=1&' + num + ':'
p url
agent.get_file(url)
end

puts online(num)