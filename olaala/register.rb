require 'rubygems'
require 'mechanize'

agent = Mechanize.new

page = agent.get('http://foobar.myolaala.com.ms:3000/register')
form = page.forms.first

form['user[contact][first_name]'] = 'marcuss'
form['user[contact][last_name]'] = form['user[contact][first_name]']
form['user[contact][email]'] = 'marcuss+1@hesonline.com'

form['contact[email_confirmation]'] = form['user[contact][email]']
form['user[password]'] = 'foobarpop'
form['password_confirmation'] = form['user[password]']
form['user[trip][profile][gender]'] = 'F'
form['user[trip][profile][qol_energy]'] = 'Never'
form['user[trip][profile][qol_overall_health]'] = 'Fair'
form['user[trip][profile][days_active_per_wk]'] = '1'
form['user[trip][profile][exercise_per_day]'] = '31 - 45'
form['user[trip][profile][what_to_track]'] = 'foobarpop'
form['user[trip][profile][perception]'] = 'Not ready'
form.checkbox_with(:name => 'confidential').check
page = agent.submit(form)
pp page