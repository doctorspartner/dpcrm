class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all
  end
  
  def new
    @company = Company.new
    if(params[:copy_company])
      @copy_company = Company.find(params[:copy_company])
      @company = @copy_company.dup
      @company.name = ''
    end
  end
  
  def create
        
    @company = Company.new(company_params)
            if @company.save
              redirect_to company_path(@company)
            else
              render :action => 'new'
    end
    
    
    
  end
  
  def show
    @company = Company.find(params[:id])
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    @company.save
    redirect_to company_path(@company)
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end
  
  def copy
    @companies = Company.all.select('name, id')
  end
  
  def test_member
    render :text => params[:id].to_s
  end
  
  private
  
  def company_params
    params.require(:company).permit(:name, :tags, :assigned_to, :email, :website, :phone, :mobile_phone, :fax, :address1, :address2, :city, :state, :zip, :comments, :support_package, :default => 'Gold')
  end
  
end


