class Contact < MailForm::Base

  include MailForm::Delivery
  attribute :name, validate: true
  attribute :email, validate: true
  attribute :message
  def headers
    {
      :subject => "My Contact Form",
      :to => "easyhome0102@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
