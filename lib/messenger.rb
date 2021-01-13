class Messenger
  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
  end

  def get(message)
    print(message)
    
    @stdin.gets
  end

  def print(message)
    @stdout.puts message
  end
end
