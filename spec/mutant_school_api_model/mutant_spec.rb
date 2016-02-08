require 'test_helper'

describe MutantSchoolAPIModel::Mutant do
  before do
    attributes = {
      mutant_name: 'Wolverine',
      real_name: 'Logan',
      power: 'SNIKT',
      eligibility_begins_at: '1976-06-11',
      eligibility_ends_at: '2050-05-03',
      may_advise_beginning_at: '1990-09-25'
    }
    @wolverine = Mutant.new attributes
  end

  describe '#save' do
    it 'creates a new mutant' do
      actual = Mutant.new(@wolverine.save)
      _(actual.to_h).must_equal(@wolverine.to_h)
    end
  end

  describe '#find' do
    it 'should retrieve the mutant that was just created' do
      @wolverine.save

      actual = Mutant.find(@wolverine.id)
      _(actual.to_h).must_equal(@wolverine.to_h)
    end

    it 'should return false if we look for a record that was just deleted' do
      @wolverine.save
      id = @wolverine.id

      @wolverine.destroy
      actual = Mutant.find(id)
      _(actual).must_equal false
      # _(actual).must_be_instance_of(Array)
      # _(actual.empty?).must_equal true
    end
  end

  describe '#all' do
    it 'should return an array of mutants' do
      # Create a mutant, so there will be at least one.
      @wolverine.save

      # Make sure `all` returns an Array.
      actual = Mutant.all
      _(actual).must_be_instance_of Array

      # Make sure the first item in the Array is a Mutant.
      _(actual.first).must_be_instance_of Mutant
    end
  end
end
