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
          res = true if performed_action.group.name == group
        end
      end
    end
    
    res
  end
  
  # Returns the number of time an action has been performed on a given day.
  def repeated_on_date(performed_actions, date, opt = {})
    action = opt[:action]
    group  = opt[:group]
    
    # Preliminary checking
    raise "performed_actions can't be nil" unless performed_actions
    raise "action or group has to be specified" unless (action or group)
    raise "date can't be nil" unless date
    
    res = 0
    performed_actions.each do |performed_action|
      if performed_action.created_at.to_date == date
        if action
          res += 1 if performed_action.name == action
        elsif group
          res += 1 if performed_action.group.name == group
        end
      end
    end
    
    res
  end
  
  # Returns true if the opt[:action] or opt[:group] has ever been
  # repeated n times the same day in the past
  def ever_been_repeated_the_same_day?(performed_actions, n, opt = {})
    action = opt[:action]
    group  = opt[:group]
    
    action_or_group = if action
      { action: action }
    else
      { group: group }
    end
    
    # Preliminary checking
    raise "performed_actions can't be nil" unless performed_actions
    raise "action or group has to be specified" unless (action or group)
    return false if performed_actions.empty?

    current_date = nil
    performed_actions.each do |performed_action|
      if current_date.nil?
        current_date = performed_action.created_at.to_date
        
        # Calls the repeated_on_date method to see if the action
        # has been repeated n times at that time
        if repeated_on_date( 
            performed_actions, current_date, action_or_group ) == n
           
           # Then we instantly return true
           return true
        end

      else
        # If a current_date has been checked, we first make sure the
        # current action's date is different, otherwise we skip it.
        next if current_date == performed_action.created_at.to_date
        
        # Otherwise, we repeat the process.
        current_date = performed_action.created_at.to_date
        
        if repeated_on_date( 
            performed_actions, current_date, action_or_group ) == n
           
           # Then we instantly return true
           return true
        end
      end
      
    end
    
    false
  end
  
end