require 'rails_helper'

describe Cohort do
  describe 'instantiation' do
    let!(:cohort) { build(:cohort) }

    it 'instantiates a cohort' do
      expect(cohort.class.name).to eq("Cohort")
    end

    it 'instantiates a location' do
      expect(cohort.location.class.name).to eq("Location")
    end

    it 'instantiates a course' do
      expect(cohort.course.class.name).to eq("Course")
    end
  end
end