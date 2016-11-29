ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 :user_name => ENV['SENGRID_USER'],
 :password => ENV['SENGRID_PWD'],
 :domain => 'sendgrid.net',
 :address => 'smtp.sendgrid.net',
 :port => 587,
 :authentication => :plain,
 :enable_starttls_auto => true
}
