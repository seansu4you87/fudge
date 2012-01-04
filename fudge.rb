require 'lib/writer'
require 'lib/h_writer'
require 'lib/m_writer'
require 'lib/variable'

#fudge model ModelName<SuperClass ivar type1:ivar1, type2:ivar2

def createModel(modelName, superClass, ivars)
    header = HWriter.new modelName, superClass, ivars
    header.writeReadMe
    header.writeNewLine
    header.writeImportFoundation
    2.times {header.writeNewLine}
    header.writeInterface
    header.writeOpenBracket
    header.writeIvars
    header.writeCloseBracket
    header.writeNewLine
    header.writeProperties
    
    imp = MWriter.new modelName, superClass, ivars
    imp.writeReadMe
    imp.writeNewLine
    imp.writeImportHeader
    2.times {imp.writeNewLine}
    imp.writeImplementation
    imp.writeNewLine
    imp.writeSynthesizes
    #imp.writeFunction 'initWithFrame:andView:', 'id', ivars
    imp.writeNewLine
    imp.writeDealloc
end

ivars = Array.new 
ivars.push Variable.new 'NSString*', 'first_name' 
ivars.push Variable.new 'NSString*', 'last_name'
ivars.push Variable.new 'NSString*', 'user_id'
ivars.push Variable.new 'BOOL', 'is_authenticated'

createModel 'User', 'TCUser', ivars