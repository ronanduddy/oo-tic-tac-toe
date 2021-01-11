class Messager
  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
  end

  def ask(message)
    tell(message)    
    @stdin.gets
  end

  def tell(message)
    @stdout.puts message
  end
end
