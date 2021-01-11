require 'coordinate'

RSpec.shared_context 'coordinate' do
  let(:coordinate) { Coordinate.new(value) }
end

RSpec.configure do |rspec|
  rspec.include_context 'coordinate', :include_shared => true
end
