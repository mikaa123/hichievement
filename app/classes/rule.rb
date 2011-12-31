class Rule
#   # Rules contains a array with all the defined rules (Rule instances)
#   Rules = []
#   
#   attr_reader :name
#   
#   class << self
#     # This part specifies the Rule's eigenclass' methods.
#     # Primarily used for the DSL
#     
#     # Creates a new Rule instance with a name and a proc,
#     # Adds it to the Rules array
#     def describe name, &test
#       Rules << Rule.new(name, &test)
#     end
#   end
#   
#   def initialize(name, &test)
#     @name = name
#     @test = test
#   end
#   
#   def user_conforms?(user)
#     # This executes the @test Proc in the context of the
#     # Rule instance. The user is given as a parameter to the
#     # @test Proc, which is here converted to a code block.
#     instance_exec(user, &@test)
#   end
end