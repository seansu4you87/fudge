class Class
  attr_reader :name, :parent, :ivars, :properties, :functions
  
  def initialize name, parent, ivars = [], properties = [], functions = []
    @name = name
    @parent = parent
    @ivars = ivars
    @properties = properties
    @functions = functions
    @functions.push self.deallocFunction
  end
  
  def deallocFunction
    dealloc = Function.new 'dealloc'
    block = CodeBlock.new
    
    @ivars.each do |ivar|
      block.lines.push ivar.releaseString if ivar.type.include? '*'
    end
    
    block.lines.push ''
    block.lines.push '[super dealloc]'
    dealloc.codeBlocks.push block
    
    dealloc
  end
  
end