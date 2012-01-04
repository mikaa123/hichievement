class PerformedAction
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  # Returns the date (day) the action has been performed.
  # Useful for querying
  field :date, :type => Date
  
  belongs_to :action_item
  embedded_in :user

  # For simplicity, let's duplicate the name of
  # the action item here
  field :name, :type => String
  
  def group
    action_item.action_group
  end
end
