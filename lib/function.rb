class Function
  #method = Function.new 'initWithFrame:andView:', 'id', ivars
  
  attr_reader :name, :type, :args, :codeBlocks
  
  def initialize name, type = 'void', args = []
    @name = name
    @type = 'void'
    @args = args
    @codeBlocks = []
  end
  
  def signatureString
    colonIndices = []
    offset = 0
    while index = name.index(':', offset)
      colonIndices.push index + 1
      offset = index + 1
    end
    
    method = name
    
    colonIndices.each_index do |i|
      var = args[i]
      index = colonIndices[i]
      
      argsString = "(#{var.type})#{var.name} "
      method.insert(index, argsString)
      
      colonIndices.each_index do 
        |j| colonIndices[j] = colonIndices[j] + argsString.length unless j == 0
      end
    end
    
    "- (#{type})#{method}"
  end
  
end