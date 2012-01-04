require 'lib/writer'
require 'lib/class'
require 'lib/function'
require 'lib/variable'
require 'lib/code_block'

#fudge model ModelName<SuperClass ivar type1:ivar1, type2:ivar2

def createModel(modelName, superClass, ivars)
  klass = Class.new modelName, superClass, ivars
  
  writer = Writer.new klass
  writer.writeClass
end

ivars = Array.new 
ivars.push Variable.new 'NSString*', 'first_name' 
ivars.push Variable.new 'NSString*', 'last_name'
ivars.push Variable.new 'NSString*', 'user_id'
ivars.push Variable.new 'BOOL', 'is_authenticated'

createModel 'User', 'TCUser', ivars