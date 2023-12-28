class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @contact = Contact.new(params_contact)
    if @contact.save
      @contacts = Contact.all
      @contact = Contact.new
    end
    respond_to do |format|
      format.js
    end
  end 

  def search
    @contacts = Contact.where("name LIKE ? OR contact_no LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    respond_to do |format| 
      format.js
    end
  end

  def show_contact
    @contact = Contact.find_by_id(params[:id])
    respond_to do |format| 
      format.js
    end
  end

  private

  def params_contact
    params.require(:contact).permit!
  end

end