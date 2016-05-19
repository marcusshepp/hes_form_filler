require 'rubygems'
require 'mechanize'

agent = Mechanize.new

page = agent.get('http://marcuspromo.healthtrails.com.ms:3000/register')
form = page.forms.first

form['user[contact][first_name]'] = 'marcuss'
form['user[contact][last_name]'] = form['user[contact][first_name]']

form['user[contact][email]'] = 'marcuss@hesonline.com'
form['email_confirmation'] = form['user[contact][email]']
form['user[password]'] = 'foobarpop'
form['password_confirmation'] = form['user[password]']
form['user[trip][profile][gender]'] = 'F'
form['user[trip][profile][qol_energy]'] = 'Never'
form['user[trip][profile][qol_overall_health]'] = 'Fair'
form.checkbox_with(:name => 'confidential').check
page = agent.submit(form)
pp page