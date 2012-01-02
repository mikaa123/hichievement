class ActionGroup
  include Mongoid::Document
  
  field :name, :type => String
  
  validates_uniqueness_of :name
  
  # n..n relationship with ActionItem
  has_and_belongs_to_many :action_items
end