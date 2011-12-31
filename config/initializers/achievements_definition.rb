# This file defines all the achievements of our application

Achievement.define "Eating Achievement" do
  set_desc "You ate well for 20 days! Woohoo."
  set_img_url "http://some-image.com"
  
  define_rule do |user|
    true
  end
end