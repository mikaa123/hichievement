class ActionGroup
  include Mongoid::Document
  
  field :name, :type => String
  field :desc, :type => String
  
  validates_uniqueness_of :name
  
  # 1..n relationship with ActionItem
  has_many :action_items
  
  ## This part specifies ActionGroup's
  # DSL for the seed file (used to create
  # groups of actions straighforwardly)
  class << self
    def add_group( group_name, group_desc, &blk )
      new_group = ActionGroup.create!(name: group_name, desc: group_desc)
      
      # In the context of the new group, we evaluate the block
      # given as argument
      new_group.instance_eval( &blk )
    end    
  end
  
  # Creates ActionItems according to the action_names array
  def with_actions( action_names )
    action_names.each do |action_name|
      action_items << ActionItem.new(name: action_name )
    end
  end
end