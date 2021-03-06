class Variable
  attr_reader :type, :name
  
  def initialize type, name
    @type = type
    @name = name
  end
  
  def score
    0
  end
  
  def releaseString
    "[#{name} release];"
  end
  
  def declareString
    "#{type} #{name};"
  end
  
  def argsString
    "(#{type})#{name}"
  end
  
  def propertyString
    if type.include? '*'
      memoryType = 'retain'
    else
      memoryType = 'assign'
    end
    
    "@property(nonatomic, #{memoryType}) #{type} #{name};"
  end
  
  def synthesizeString
    "@synthesize #{name};"
  end
  
end