require 'test_helper'

describe MutantSchoolAPIModel::Mutant, '#save' do
  it 'creates a new mutant' do
    attributes = {
      mutant_name: 'Wolverine',
      real_name: 'Logan',
      power: 'SNIKT',
      eligibility_begins_at: '1976-06-11',
      eligibility_ends_at: '2050-05-03',
      may_advise_beginning_at: '1990-09-25'
    }
    wolverine = Mutant.new attributes
    actual = Mutant.new(wolverine.save)
    _(actual.to_h).must_equal(wolverine.to_h)
  end
end

describe MutantSchoolAPIModel::Mutant, '#find' do
  it 'should retrieve the mutant that was just created' do
  end
end
