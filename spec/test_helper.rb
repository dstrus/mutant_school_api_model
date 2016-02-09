$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'mutant_school_api_model'
require 'minitest/autorun'
require 'minitest/reporters'
require 'factories/mutant_factory'
require 'factories/term_factory'
require 'mocha/mini_test'

Minitest::Reporters.use!

include MutantSchoolAPIModel

def with_phony_response(&block)
  json_response = "{\"id\":2485,\"url\":\"https://mutant-school.herokuapp.com/api/v1/mutants/2485\",\"created_at\":\"2016-02-09T21:26:56.315Z\",\"updated_at\":\"2016-02-09T21:26:56.315Z\",\"mutant_name\":\"Wolverine\",\"real_name\":\"Logan\",\"power\":\"SNIKT\",\"eligibility_begins_at\":\"1976-06-11T00:00:00.000Z\",\"eligibility_ends_at\":\"2050-05-03T00:00:00.000Z\",\"may_advise_beginning_at\":\"1990-09-25T00:00:00.000Z\",\"advisor\":null}"

  HTTP.stubs(:post).returns(stub(
    code: 201,
    to_s: json_response
  ))
  HTTP.stubs(:get).returns(stub(
    code: 200,
    to_s: json_response
  ))
  yield
end
