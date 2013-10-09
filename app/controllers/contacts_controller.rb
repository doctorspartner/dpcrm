class ContactsController < ApplicationController
before_filter :set_contact, :only => [:show, :edit, :update, :destroy]
  
  def index
   if params[:id]
      @contacts = Contact.where(:company_id => params[:id])
      @company = Company.find(params[:id])
   else
     @contacts = Contact.all
   end
  end
  
  def show
    render :text => request.request_path
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    puts params.inspect
    @contact.save
    redirect_to contacts_path
  end
  
  def edit
    
  end
  
  def update
    @contact.update(contact_params)
    @contact.save
  end
  
  def destroy
    @contact.destroy
  end
  
private

def set_contact
  @contact = Contact.find(params[:id])
end

def contact_params
  params.require(:contact).permit(:first_name, :last_name, :company_id, :tags, :assigned_to, :title, :email, :phone, :mobile_phone, :address1, :address2, :city, :state, :zip, :comments, :conference, :support_package)
end  
  
end
