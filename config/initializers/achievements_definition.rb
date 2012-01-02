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

Achievement.define "OMG!" do
  set_desc "No f. way!"
  set_img_url "http://some-image.com"
  
  define_rule do |user|
    
    if user.performed_actions.where(name: "niquer").count >= 5
      true
    else
      false
    end
  end
end