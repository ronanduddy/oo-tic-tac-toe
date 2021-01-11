RSpec.shared_context 'stdlib' do
  let(:mock_stdin) { StringIO.new }
  let(:mock_stdout) { StringIO.new }
end

RSpec.configure do |rspec|
  rspec.include_context 'stdlib', :include_shared => true
end
