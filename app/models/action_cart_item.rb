class ActionCartItem
  include Mongoid::Document
  
  belongs_to :action_item
  belongs_to :action_group
  
  embedded_in :action_cart
end
