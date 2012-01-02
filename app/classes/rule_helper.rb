module RuleHelper
  
  # Returns true if the opt[:action] or opt[:group] is repeated everyday
  # for opt[:days] day.
  def repeated_every_day?(performed_actions, opt = {})
    action = opt[:action]
    group  = opt[:group]
    days   = opt[:days]
    
    # Preliminary checking
    raise "performed_actions can't be nil" unless performed_actions
    raise "action or group has to be specified" unless (action or group)
    raise ":days need to be specified" unless days
    return false if performed_actions.empty?
  end
  
  # Returns true if the opt[:action] or opt[:group] has been performed
  # on `date`
  def action_performed_on_date?(performed_actions, date, opt = {})
    action = opt[:action]
    group  = opt[:group]
    
    # Preliminary checking
    raise "performed_actions can't be nil" unless performed_actions
    raise "action or group has to be specified" unless (action or group)
    raise "date can't be nil" unless date
    
    res = false
    performed_actions.each do |performed_action|
      if performed_action.created_at.to_date == date
        if action
          res = true if performed_action.name == action
        elsif group
          res = true if performed_action.group == group
        end
      end
    end
    
    res
  end
end