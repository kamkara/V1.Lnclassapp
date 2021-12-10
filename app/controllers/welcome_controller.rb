class WelcomeController < ApplicationController
  
  # redirect user to feeds  if signed
  def index
    redirect_to feeds_path if user_signed_in?
  end
end
