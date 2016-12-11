class Contact < ApplicationRecord
  include MailForm::Delivery

  attributes :name, :email, :message

  def headers
    {
      to: 'g3orge.miller@gmail.com',
      from: %("#{name}" <#{email}>),
      subject: 'Hello! From KingCode' 
    }
  end
end
