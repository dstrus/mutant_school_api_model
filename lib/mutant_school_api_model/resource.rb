module MutantSchoolAPIModel
  class Resource
    def self.base_url
      'https://mutant-school.herokuapp.com/api/v1'
    end

    def self.url
      self.base_url + "/#{self.name.split('::').last.downcase}s"
    end
  end
end
