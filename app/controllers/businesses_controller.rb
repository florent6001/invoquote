class BusinessesController < ApplicationController
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

  private

  def business_params
    params.require(:business).permit(:name, :address, :email, :phone_number, :registration_number, :tax_rate)
  end
end
