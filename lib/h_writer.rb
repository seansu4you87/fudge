class HWriter < Writer
  def initialize className, superClass, ivars = nil
    super className, superClass, ivars
    @fileName = "#{className}.h"
    @file = File.open @fileName, 'w'
  end
end