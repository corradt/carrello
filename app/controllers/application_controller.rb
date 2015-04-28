class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

   private
    
    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create(user_id: current_user.id)
      @cart.save
      session[:cart_id] = @cart.id
      @cart
    end

    def totItems
      qty=0
      set_cart.ordered_products.each do |item|
        qty += item.quantity
      end
      qty
    end

    helper_method :totItems

end