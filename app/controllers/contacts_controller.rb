class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.contact_message(params[:contact]).deliver_later
      flash[:notice] = ''
      redirect_to :action => 'new'
      return
    end
  end
end
