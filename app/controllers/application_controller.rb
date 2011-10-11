class ApplicationController < ActionController::Base
  before_filter :authenticate_user! # devise
  protect_from_forgery
end
