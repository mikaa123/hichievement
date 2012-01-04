# This file defines all the achievements of our application

Achievement.define "HelloWorld!" do
  set_desc "Congratulation, you just performed your first action!"
  set_img_url "http://some-image.com"
  
  define_rule do |user|
    if user.performed_actions.count >= 1
      true
    else
      false
    end
  end
end

Achievement.define "GodSpeed" do
  set_desc "You had 3 coffees the same day, ready to sleep?"
  set_img_url "unset"
  
  define_rule do |user|
    ever_been_repeated_the_same_day?(user.performed_actions, 3, action: "Coffee")
  end
end

Achievement.define "5 fruits a day" do
  set_desc "That's something you should do everyday!"
  set_img_url "unset"
  
  define_rule do |user|
    ever_been_repeated_the_same_day?(user.performed_actions, 5, action: "Fruit")
  end
end

Achievement.define "Whale" do
  set_desc "You juste became one."
  set_img_url "unset"
  
  define_rule do |user|
    ever_been_repeated_the_same_day?(user.performed_actions, 10, group: "Food")
  end
end

# Achievement.define "OMG!" do
#   set_desc "No f. way!"
#   set_img_url "http://some-image.com"
#   
#   define_rule do |user|
#     
#     if user.performed_actions.where(name: "niquer").count >= 5
#       true
#     else
#       false
#     end
#   end
# end