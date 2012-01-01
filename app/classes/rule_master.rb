module RuleMaster
  def self.unlocked_achievements( user )
    return nil unless user
    return nil unless user.is_a? User
    
    Achievement::List.map { |a| a.name if a.user_conforms?(user) }.compact
  end
end