class Messager
  def initialize(stdout)
    @stdout = stdout
  end

  def print(message)
    @stdout.puts message
  end
end
