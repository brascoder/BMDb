require 'rails_helper'

RSpec.describe Actor, type: :model do
  let(:actor) { Actor.new(name: 'Tom Hanks') }

  it 'is valid' do
    expect(actor).to be_valid
  end

  it 'is invalid with no name' do
    expect(Actor.new()).to be_invalid
  end

  it 'should be associated with movies by roles' do
    expect(actor).to respond_to(:roles, :movies)
  end
end
