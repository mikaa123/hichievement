class UnlockedAchievement
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name, :type => String
  
  # You can't unlock the same achievement twice
  validates_uniqueness_of :name
  
  embedded_in :user
end
