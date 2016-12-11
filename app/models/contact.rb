class Contact < ApplicationRecord
  include MailForm::Delivery

  append :remote_ip, :user_agent, :session
  attributes :name, :email, :message

  def headers
    {
      to: 'g3orge.miller@gmail.com',
      from: %("#{name}" <#{email}>)
      subject: 'Hello! From KingCode' 
    }
  end
end
