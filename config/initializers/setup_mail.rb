ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 :user_name => 'AndersonPiva',
 :password => '123456789abcde',
 :domain => 'sendgrid.net',
 :address => 'smtp.sendgrid.net',
 :port => 587,
 :authentication => :plain,
 :enable_starttls_auto => true
}
