class ContactsController < ApplicationController
  def new 
    @contact_form = Contact.new
  end

  def create
    @contact_form = Contact.new(contact_params)
    @contact_form.request = request
    if @contact_form.deliver
      redirect_to root_path, notice: 'Thank you for message!'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
