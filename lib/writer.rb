class Writer
  attr_reader :fileName, :klass
  
  def initialize klass, path = './'
    @klass = klass
    @tabs = 0
    @path = path
  end
  
  def switchToHeader
    @file.close unless @file == nil
    @fileName = "#{@path}/#{@klass.name}.h"
    @file = File.open @fileName, 'w'
  end
  
  def switchToImplementation
    @file.close unless @file == nil
    @fileName = "#{@path}/#{@klass.name}.m"
    @file = File.open @fileName, 'w'
  end
  
  def writeClass
    writeH
    writeM
  end
  
  def writeH
    switchToHeader
    
    writeReadMe
    writeNewLine
    
    writeImportFoundation
    writeNewLine 2
    
    writeInterface
    writeOpenBracket
    writeIvars
    writeCloseBracket
    writeNewLine
    
    writeProperties
    writeNewLine
    
    writeEnd
    
    @file.close
    @file = nil
  end
  
  def writeM
    switchToImplementation
    
    writeReadMe
    writeNewLine
    
    writeImportHeader
    writeNewLine 2
    
    writeImplementation
    writeNewLine
    
    writeSynthesizes
    writeNewLine
    
    writeFunctions
    writeNewLine
    
    writeEnd
    
    @file.close
    @file = nil
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
  
  def writeNewLine num = 1
    num.times {write "\n"}
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
    writeImport "#{@klass.name}.h"
  end
  
  def writeImportFoundation
    writeImportLibrary 'Foundation'
  end
  
  def writeInterface
    write "@interface #{@klass.name} : #{@klass.parent}"
  end
  
  def writeImplementation
    write "@implementation #{@klass.name}"
  end
  
  def writeEnd
    write "@end"
  end
  
  def writeIvars
    @klass.ivars.each {|i| writeIvar i}
  end
  
  def writeIvar ivar
    write ivar.declareString
  end
  
  def writeProperties
    @klass.ivars.each {|i| writeProperty i}
  end
  
  def writeProperty ivar
    write ivar.propertyString
  end
  
  def writeSynthesizes
    @klass.ivars.each {|i| writeSynthesize i}
  end
  
  def writeSynthesize ivar
    write ivar.synthesizeString
  end
  
  def writeRelease ivar
    write "[#{ivar.name} release];"
  end
  
  def writeFunctions
    @klass.functions.each {|func| writeFunction func}
  end
  
  def writeFunction func
    write func.signatureString
    writeOpenBracket
    func.codeBlocks.each {|block| writeCodeBlock block}
    writeCloseBracket
  end
  
  def writeCodeBlock block
    block.lines.each {|line| write line}
  end
  
  #Setters and Getters
  
  def readMe
"//
//  #{@fileName}
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