#!/usr/bin/env ruby
# Encoding: utf-8

require "yaml"
require "bundler"
Bundler.require :default

Interval = 15

tmpl = Erubis::Eruby.new File.read("mail.erb")

db = Sequel.mysql2 YAML.load_file("config.yml")
db.fetch("SELECT id, login, email FROM accounts WHERE role='visitor' AND old_password IS NOT NULL ORDER BY login ASC") do |row|
  mail = Mail.new do
    from     'team@linuxfr.org'
    to       row[:email]
    subject  '[LinuxFr.org] Suppression des anciens mots de passe et nettoyage des comptes obsolètes'
    body     tmpl.result(row)
  end
  mail.delivery_method :sendmail
  mail.deliver
  puts "✔ #{row[:id]}. #{row[:login]} <#{row[:email]}>"
  sleep Interval
end

