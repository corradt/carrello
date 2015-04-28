module CurrentCart
  extend ActiveSupport::Concern

 


    #helper_method :set_cart

    def countItems
      countObjects=0
      #user.cart.line_items  se vogliamo sapere gli oggetti di un utente
      set_cart.line_items.each do |item|
        countObjects += item.quantity
      end
      return countObjects   
    end 
    #helper_method :countItems
end