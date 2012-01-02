# This file defines all the achievements of our application

Achievement.define "Eating Achievement" do
  set_desc "You ate well for 20 days! Woohoo."
  set_img_url "http://some-image.com"
  
  define_rule do |user|
    if user.performed_actions.count >= 2
      true
    else
      false
    end
  end
end

Achievement.define "Super Achievement" do
  set_desc "Yay."
  set_img_url "http://some-image.com"
  
  define_rule do |user|
    if user.performed_actions.count >= 5
      true
    else
      false
    end
  end
end