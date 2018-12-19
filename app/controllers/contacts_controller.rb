class ContactsController < ApplicationController
  require 'sendgrid-ruby'
  #require 'dotenv/load'
  require 'dotenv'
  Dotenv.load('teste.env')
  include SendGrid

  def new
    @contact = Contact.new
  end

  def sendEmail




  end

  def create



    @contact = Contact.new(params[:contact])
    @contact.request = request

    if @contact.deliver

      system "echo \"export SENDGRID_API_KEY=\'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\'\" > sendgrid.env"
      system "source ./sendgrid.env"



      from = Email.new(email: @contact.email)
      to = Email.new(email: 'pmiranda7410@gmail.com')
      subject = @contact.assunto
      content = Content.new(type: 'text/plain', value: @contact.message)
      mail = Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY']) #ENV['SENDGRID_API_KEY']
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
      flash.now[:error] = nil
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
