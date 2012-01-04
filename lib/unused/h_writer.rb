class HWriter < Writer
  def initialize klass
    super klass
    @fileName = "#{@klass.name}.h"
    @file = File.open @fileName, 'w'
  end
end