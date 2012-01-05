module DashboardHelper
  def selected_actions_from_group( action_group )
    current_user.action_cart.action_cart_items.where(:action_group_id => action_group.id)
  end
end
