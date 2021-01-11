require 'messenger'
require_relative 'stdlib'

RSpec.shared_context 'messenger' do
  include_context 'stdlib'

  let(:messenger) { Messenger.new(mock_stdin, mock_stdout) }
end

RSpec.configure do |rspec|
  rspec.include_context 'messenger', :include_shared => true
end
