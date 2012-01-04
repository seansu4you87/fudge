class MWriter < Writer
  def initialize klass
    super klass
    @fileName = "#{@klass.name}.m"
    @file = File.open @fileName, 'w'
  end
end