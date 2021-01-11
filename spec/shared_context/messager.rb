require 'messager'
require_relative 'stdlib'

RSpec.shared_context 'messager' do
  include_context 'stdlib'

  let(:messager) { Messager.new(mock_stdin, mock_stdout) }
end

RSpec.configure do |rspec|
  rspec.include_context 'messager', :include_shared => true
end
