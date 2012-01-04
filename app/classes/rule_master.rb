module RuleMaster
  
  # Returns an array containing Achievement objects that have been unlocked
  def self.unlocked_achievements( user )
    return nil unless user
    return nil unless user.is_a? User
    
    Achievement::List.map { |a| a if a.user_conforms?(user) }.compact
  end
end