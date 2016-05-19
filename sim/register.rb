require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get('http://defnotmarcus.sim.com.ms:3000/register')
form = page.forms.first
form['contact[first_name]'] = 'notmarcusformfiller'
form['contact[last_name]'] = 'notmarcusformfiller'
form['contact[email]'] = 'notmarcusformfiller@formfiller.io'
form['contact[email_confirmation]'] = form['contact[email]']
form['user[password]'] = 'foobarpop'
form['user[password_confirmation]'] = form['user[password]']
form['profile[gender]'] = 'F'
form['profile[qol_energy]'] = 'Never'
form['profile[qol_overall_health]'] = 'Fair'
form['profile[days_active_per_wk]'] = '1'
form['profile[exercise_per_day]'] = '31 - 45'
form['profile[what_to_track]'] = 'foobarpop'
form['profile[perception]'] = 'Not ready'
form.checkbox_with(:name => 'confidential').check
page = agent.submit(form)
pp page