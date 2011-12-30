class ActionItem
  include Mongoid::Document
  has_many :performed_actions
  field :description, :type => String
end
