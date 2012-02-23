# see http://stackoverflow.com/questions/3546289/override-devise-registrations-controller

class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def update
    @user.city = params[:city]
    @user.country = params[:country]
    super
  end
end
