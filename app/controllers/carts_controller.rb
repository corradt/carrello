class CartsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts =Cart.all
    render nothing:true
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    render nothing:true
  end

  # GET /carts/new
  def new
    @cart = Cart.new
    render nothing:true
  end

  # GET /carts/1/edit
  def edit
    render nothing:true
  end


  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy

    @cart.ordered_products.delete_all
    respond_to do |format|
      format.html { redirect_to ordered_products_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  
      # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end
end
