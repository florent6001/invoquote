class BusinessesController < ApplicationController

  def index
    @business = current_user.businesses
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save!
      redirect_to dashboard_path, notice: "Business successfully created"
    else
      render 'new', notice: "An error occured"
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update(business_params)
      redirect_to dashboard_path, notice: "Business successfully updated"
    else
      render 'index', notice: "An error occured"
    end
  end

  def destroy
    @business = Business.find(params[:id])
    if @business.destroy
      redirect_to dashboard_path, notice: "Business successfully deleted"
    else
      render 'index', notice: "An error occured" #
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :email, :phone_number, :registration_number, :tax_rate)
  end
end
