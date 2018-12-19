class Contact < MailForm::Base
  require 'sendgrid-ruby'
  include SendGrid
  attribute :name,    :validate => true
  attribute :email,   :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :assunto, :validate => true
  attribute :message, :validate => true
  attribute :nickname,:captcha  => true

  def headers
    {
    :subject => "Contact Form",
    :to => "pmiranda7410@gmail.com",
    :from => %("#{name}" <#{email}>)
    }
  end
end
