SMTP_SETTINGS = {
  address:        'smtp.sendgrid.net',
  port:           '587',
  domain:         'heroku.com',
  user_name:      ENV.fetch('SENDGRID_USERNAME'),
  password:       ENV.fetch('SENDGRID_PASSWORD'),
  authentication: :plain,
  enable_starttls_auto: true
}

if ENV['EMAIL_RECIPIENTS'].present?
  Mail.register_interceptor RecipientInterceptor.new(ENV['EMAIL_RECIPIENTS'])
end
