class ActionCart
  include Mongoid::Document
  
  embedded_in :user
  embeds_many :action_cart_items
  
  def empty?
    action_cart_items.empty?
  end
end
