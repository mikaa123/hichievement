class User
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  field :email, :type => String
  embeds_many :p_actions
  # This protects the attributes from mass-assignment (i.e. new(args))
  attr_protected :provider, :uid

  # Creates a new user from the given provider
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end
end

class Performed_action
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  belongs_to :actionitem
  embedded_in :user
  
end