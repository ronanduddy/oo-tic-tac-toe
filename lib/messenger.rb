class Messenger
  def initialize(stdin, stdout)
    @stdin = stdin
    @stdout = stdout
  end

  def get(message)
    print(message)
    value = @stdin.gets
    print("\n")

    value.strip
  end

  def print(message)
    @stdout.print message
  end
end
