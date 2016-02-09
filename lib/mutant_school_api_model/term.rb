require "mutant_school_api_model/resource"

module MutantSchoolAPIModel
  class Term < MutantSchoolAPIModel::Resource

    def self.model_specific_attribute_names
      [
        :begins_at,
        :ends_at
      ]
    end

  end
end