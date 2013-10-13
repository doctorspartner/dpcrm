class ContactsController < ApplicationController
before_filter :set_contact, :only => [:show, :edit, :update, :destroy]
  
  def index
   if params[:company_id]
      @contacts = Contact.where(:company_id => params[:company_id])
      @company = Company.find(params[:company_id])
   else
     @contacts = Contact.all
   end
  end
  
  def show
    
  end
  
  def new
    @contact = Contact.new
    if params[:company_id]
      @company = Company.find(params[:company_id])
      # dealing with contacts added with company
    else
      @companies = Company.all.order("name")
      #dealing with contacts added independently
    end
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
        if params[:company_id]
          redirect_to company_contacts_path
        else
          redirect_to contacts_path
        end
    else
        if params[:company_id]
          redirect_to new_company_contact_path
          flash[:notice] = @contact.errors.full_messages
        else
          redirect_to new_contact_path
          flash[:notice] = @contact.errors.full_messages
        end
          #render :action => 'new', :locals => {:company_id => params[:company_id]}
      
      
    end
    
    
    
   
  end
  
  def edit
    if params[:company_id]
      @company = Company.find(params[:company_id])
      # dealing with contacts added with company
    else
      @companies = Company.all.order("name")
      #dealing with contacts added independently
    end
  end
  
  def update
    @contact.update(contact_params)
    @contact.save
    if @contact.save
        if params[:company_id]
          redirect_to company_contacts_path
        else
          redirect_to contacts_path
        end
    else
        if params[:company_id]
          redirect_to new_company_contact_path
          flash[:notice] = @contact.errors.full_messages
        else
          redirect_to new_contact_path
          flash[:notice] = @contact.errors.full_messages
        end
          #render :action => 'new', :locals => {:company_id => params[:company_id]}
      
      
    end
    
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
