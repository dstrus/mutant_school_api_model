$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'mutant_school_api_model'
require 'minitest/autorun'
require 'minitest/reporters'
require 'factories/mutant_factory'

Minitest::Reporters.use!

include MutantSchoolAPIModel
