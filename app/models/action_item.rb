class ActionItem
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  
  # n..n relationship with ActionGroup
  belongs_to :action_group
end