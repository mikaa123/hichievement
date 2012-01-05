class ActionCartsController < ApplicationController
  
  # Adds an action item to the cart
  # POST /dashboard/add_to_cart
  # Param: action_item  
  def add_to_cart
    # If a user doesn't have a cart yet, we create it
    # current_user.create_action_cart unless current_user.action_cart
    
    action_item = ActionItem.find(params[:action_item])
    # We create a new ActionCartItem, and add it to the cart
    current_user.action_cart.action_cart_items.create!(action_item: action_item,
                                                       action_group: action_item.action_group)
    
    # Redirect to the dashboard
    redirect_to dashboard_path
  end
  
  # Removes the content of the cart
  def empty_cart
    current_user.empty_cart
    
    redirect_to dashboard_path
  end
  
  # Validates all the action cart items
  def checkout_cart
    # Checking out the cart returns the list of all the newly obtained
    # achievements. We want to use them to construct an appropriate flash
    # message
    achievements_unlocked = current_user.checkout_cart * ', '
    
    unless achievements_unlocked.empty?
      redirect_to dashboard_path, :flash => { achievements: "Achievement(s) unlocked: #{achievements_unlocked}" }
    else
      redirect_to dashboard_path
    end
  end
end