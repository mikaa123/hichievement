class ActionCartItem
  include Mongoid::Document
  
  belongs_to :action_item
  embedded_in :action_cart
end
