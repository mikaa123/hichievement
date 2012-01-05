class ActionItem
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  
  belongs_to :action_group
end