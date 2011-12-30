class PerformedAction
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  belongs_to :action_item
  embedded_in :user
end
