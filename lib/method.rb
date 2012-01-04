class Method
  attr_reader :name, :type:, :args, :code
  
  def initialize (name, type = 'void', args = [])
    @name = name
    @type = 'void'
    @args = args
    @code = []
  end
  
  
end