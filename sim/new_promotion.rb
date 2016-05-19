require 'rubygems'
require 'mechanize'

agent = Mechanize.new

page = agent.get('http://dashboard.sim.com.ms:3000/promotions/new')
pp page # permission probs

