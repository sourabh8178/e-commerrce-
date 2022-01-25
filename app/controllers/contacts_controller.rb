class ContactsController < ApplicationController

  def index
    @contact = Contact.new()
  end

  def create

    @contact = Contact.create(name: params[:form][:name], email: params[:form][:email], subject: params[:form][:subject], message: params[:form][:message])
    ContactusMailer.contact_mail(@contact).deliver_now 
    redirect_to contacts_path
  end

end