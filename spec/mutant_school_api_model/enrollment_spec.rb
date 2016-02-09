require 'test_helper'

describe MutantSchoolAPIModel::Enrollment do
  describe '#find' do
    it 'should retrieve the enrollment if we know the ID and the student' do
      actual = Enrollment.find(1, parent: Mutant.find(1))
      _(actual).must_be_instance_of(Enrollment)
    end
  end

  describe '#all' do
    it 'should return an array of enrollments' do
      actual = Enrollment.all(parent: Mutant.find(1))
      _(actual).must_be_instance_of Array
      _(actual.first).must_be_instance_of Enrollment
    end
  end

  describe '#term' do
    it 'should be an instance of Term' do
      enrollment = Enrollment.find(1, parent: Mutant.find(1))
      _(enrollment.term).must_be_instance_of Term
    end
  end

  describe '#student' do
    it 'should be an instance of Mutant' do
      enrollment = Enrollment.find(1, parent: Mutant.find(1))
      _(enrollment.student).must_be_instance_of Mutant
    end
  end
end
