class OrderedProductsController < ApplicationController
    
  before_action :set_cart, only:[:index,:create,:destroy,:update]
  
  before_action :set_ordered_product, only: [:index,:show,:update,:destroy]
  
  def index
    @ordered_products=@cart.ordered_products
  end

  # POST /ordered_products
  # POST /ordered_products.json
  def create
    product = Product.find(params[:product_id])
    qty=params[:quantity].to_i   
    @ordered_product = @cart.add_product(product.id,qty)
    @ordered_product.save
    respond_to do |format|
      format.html { redirect_to store_index_url, notice: 'Order placed successfully' }
      format.json { head :no_content }
    end
  end
  
  # DELETE /ordered_products/1
  # DELETE /ordered_products/1.json
  def destroy
    ordered_product = OrderedProduct.find(params[:id])
    ordered_product.destroy
    respond_to do |format|
      format.html { redirect_to ordered_products_url, notice: 'Ordered product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update

    respond_to do |format|
      format.json do
        begin
          quantity = Integer( params['ordered_product']['quantity'])
          ordered_product=@cart.ordered_products.find(params[:id])
          ordered_product.update_attribute(:quantity,quantity)
          @total=0
          @total_items=0
          @cart.ordered_products.each do |ordered_product|
            @total += ordered_product.product.price * ordered_product.quantity
            
            @total_items += ordered_product.quantity
            
            
          end
          
          render :update
        rescue  ArgumentError => e
          
        end
        
      end

    end

  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_product
       @ordered_product =OrderedProduct.find_by(product_id: params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordered_product_params
      params.require(:ordered_product).permit(:quantity, :product_id, :cart_id, :price_per_unit)
    end
end
