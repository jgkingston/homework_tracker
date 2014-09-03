require 'rails_helper'

describe Location do
  describe 'instantiation' do
    let!(:location) { build(:location) }

    it 'instantiates a location' do
      expect(location.class.name).to eq("Location")
    end
  end
end