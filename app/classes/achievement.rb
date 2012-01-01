class Achievement
  # Contains the list of all the achievements
  List = []
  
  class << Achievement
    def define name, &blk_def
      List.each do |achievement|
        if achievement.name == name
          raise "Achievement with the name #{name} already exists."
        end
      end
      
      new_achievement = Achievement.new( name )
      new_achievement.instance_eval( &blk_def )
      List << new_achievement
      
      new_achievement
    end
  end
  
  attr_accessor :name, :img_url, :desc, :rule

  def initialize (name)
    @name = name
  end
  
  # Returns true or false, depending on the execution
  # of the achievement's rule on the given user
  def user_conforms?(user)
    @rule.call(user)
  end
  
  # For the DSL
  private
  def set_desc(desc); @desc = desc; end
  def set_img_url(img_url); @img_url = img_url; end
  
  def define_rule(&rule)
    raise "rule should have one parameter (user)" unless rule.arity == 1
    @rule = rule
  end
end