class PerformedAction
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  belongs_to :action_item
  embedded_in :user

  # For simplicity, let's duplicate the name of
  # the action item here
  field :name, :type => String
end
