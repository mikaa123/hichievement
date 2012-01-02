class ActionItem
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  
  # n..n relationship with ActionGroup
  has_and_belongs_to_many :action_groups
end