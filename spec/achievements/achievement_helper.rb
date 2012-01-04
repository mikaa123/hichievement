class MockPerformedAction
  attr_accessor :name, :group, :created_at
  def initialize(name, group, created_at)
    @name = name
    @group = group
    @created_at = created_at
  end
end