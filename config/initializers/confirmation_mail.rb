ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  '465',
  :authentication       =>  :plain,
  :user_name            =>  'apikey',
  :password             =>  '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',
  :domain               =>  'connectus-enacuts.herokuapp.com',
  :enable_starttls_auto  =>  true
}
