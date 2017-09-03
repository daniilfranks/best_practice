# gem install mail
require 'mail'

Mail.defaults do
  delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                           :port      => 587,
                           :domain    => "gmail.com",
                           :user_name => "",
                           :password  => "",
                           :authentication => 'plain',
                           :enable_starttls_auto => true }
end

mail = Mail.deliver do
  to 'danila_babanov@yahoo.com'
  from 'babanovs5@gmail.com'
  subject 'This is the subject of your email'
  text_part do
    body 'Hello world in text'
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body '<b>Hello world in HTML</b>
          <p>Text message.</p>'
  end
end
