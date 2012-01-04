class User
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  field :email, :type => String
  embeds_many :performed_actions
  embeds_many :unlocked_achievements
  
  # The action cart stores the actions to be validated
  embeds_one :action_cart
  
  # This protects the attributes from mass-assignment (i.e. new(args))
  attr_protected :provider, :uid

  # Creates a new user from the given provider
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end
  
  # Removes all items from the cart
  def empty_cart
    action_cart.action_cart_items.delete_all
  end
  
  # Creates performed actions from the action_cart
  def checkout_cart
    raise "No cart for user" if action_cart.nil?
    raise "Empty cart" if action_cart.empty?
    
    # For each item in the cart, we add them to the user's
    # performed actions and retrieve any unlocked achievement object
    achievements = action_cart.action_cart_items.map do |item|
      
      action_item = item.action_item
      if performed_actions.create!(action_item: action_item, name: action_item.name, date: Date.today)
        
        # This returns an array of unlocked achievements
        RuleMaster.unlocked_achievements( self )
      end
      
    end
    
    # Creates an array with the names of the newly obtained achievements
    new_achievements = achievements.compact.flatten.map do |achievement|
      unless unlocked_achievements.where(name: achievement.name).exists?
        
        # The user doesn't have the achievement yet!!11 let's add it!!!
        unlocked_achievements.create!(name: achievement.name, desc: achievement.desc)
        achievement.name
      end
    end
    
    # Empty the cart
    empty_cart
    
    # Return the name of the newly obtained achievements
    new_achievements.compact
  end
end

