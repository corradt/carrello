class PagesController < ApplicationController
	before_action :authenticate_user!

  def home
  	if current_user
  		redirect_to store_index_path
  	end 
  end

  def contacts
  end
end
