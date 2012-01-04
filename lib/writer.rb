class Writer
  attr_reader :file, :fileName, :className, :superClass, :ivars
  
  def initialize className, superClass, ivars = nil
    @className = className
    @superClass = superClass
    @ivars = ivars
    @tabs = 0
  end
  
  def write string
    tabString = ""
    @tabs.times {tabString = tabString + "\t"}
    @file.puts  tabString + string
  end
  
  def writeOpenBracket
    write '{'
    @tabs += 1
  end
  
  def writeCloseBracket
    @tabs -= 1
    write '}'
  end
  
  def writeNewLine
    write "\n"
  end
  
  def writeReadMe
    write readMe
  end
  
  def writeImport fileName
    write "#import \"#{fileName}\""
  end
  
  def writeImportLibrary library
    writeImport "<#{library}/#{library}.h>"
  end
  
  def writeImportHeader
    writeImport "#{@className}.h"
  end
  
  def writeImportFoundation
    writeImportLibrary 'Foundation'
  end
  
  def writeInterface
    write "@interface #{className} : #{superClass}"
  end
  
  def writeImplementation
    write "@implementation #{className}"
  end
  
  def writeIvars
    ivars.each {|i| writeIvar i}
  end
  
  def writeIvar ivar
    write "#{ivar.type} #{ivar.name};"
  end
  
  def writeProperties
    ivars.each {|i| writeProperty i}
  end
  
  def writeProperty ivar
    if ivar.name.include? '*'
      memoryType = 'retain'
    else
      memoryType = 'assign'
    end
    
    write "@property(nonatomic, #{memoryType}) #{ivar.type} #{ivar.name};"
  end
  
  def writeSynthesizes
    ivars.each {|i| writeSynthesize i}
  end
  
  def writeSynthesize ivar
    
    write "@synthesize #{ivar.name};"
  end
  
  def writeFunction funcName, returnType = 'void', params = nil
    colonIndices = []
    offset = 0
    while index = funcName.index(':', offset)
      colonIndices.push index + 1
      offset = index + 1
    end
    
    method = funcName
    
    colonIndices.each_index do |i|
      var = params[i]
      index = colonIndices[i]
      
      paramsString = "(#{var.type})#{var.name} "
      method.insert(index, paramsString)
      
      colonIndices.each_index do 
        |j| colonIndices[j] = colonIndices[j] + paramsString.length unless j == 0
      end
    end
    
    write "- (#{returnType})#{funcName}"
    
  end
  
  def writeDealloc
    writeFunction 'dealloc'
    writeOpenBracket
    
    @ivars.each do |ivar|
      writeRelease ivar if ivar.type.include? '*'
    end
    
    writeNewLine
    write '[super dealloc];'
    writeCloseBracket
  end
  
  def writeRelease ivar
    write "[#{ivar.name} release];"
  end
  
  #Setters and Getters
  
  def readMe
"//
//  #{fileName}
//  {Project}
//
//  Created by {Fudge} on {Date}
//  Copyright {YEAR}. All rights reserved.
//"
  end
  
end

=begin
    @file.puts '#import <Foundation/Foundation.h>'
    @file.puts ''
    @file.puts ''
    @file.puts "@interface #{modelName} : #{superClass}"
    @file.puts '{'
=end

=begin

How to override properties

def className=(value)
  puts 'in setter'
  @className = value
end

def className
  puts 'in getter'
  @className
end

=end