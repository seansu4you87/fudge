class MWriter < Writer
  def initialize className, superClass, ivars = nil
    super className, superClass, ivars
    @fileName = "#{className}.m"
    @file = File.open @fileName, 'w'
  end
end