require 'spec_helper'

describe Achievement do
  it "can be instanciated" do
    Achievement.new.should be_an_instance_of(Achievement)
  end

  it "can be saved successfully" do
    Achievement.create!(:description => 'foo').should be_persisted
  end
end
