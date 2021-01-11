require 'grid'
require_relative 'messager'

RSpec.shared_context 'grid' do
  include_context 'messager'

  let(:grid) { Grid.new(messager) }
end

RSpec.configure do |rspec|
  rspec.include_context 'grid', :include_shared => true
end
