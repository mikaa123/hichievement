class ActionGroup
  include Mongoid::Document
  
  field :name, :type => String
  field :desc, :type => String
  
  validates_uniqueness_of :name
  
  # 1..n relationship with ActionItem
  has_many :action_items
end