$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mutant_school_api_model'
require 'minitest/autorun'
require 'minitest/reporters'
require 'factories/mutant_factory'
require 'factories/term_factory'
require 'mocha/mini_test'

Minitest::Reporters.use!

include MutantSchoolAPIModel
