require 'grid'
require_relative 'messenger'

RSpec.shared_context 'grid' do
  include_context 'messenger'

  let(:grid) { Grid.new(messenger) }
end

RSpec.configure do |rspec|
  rspec.include_context 'grid', :include_shared => true
end
