module MutantSchoolAPIModel
  class Mutant

    def self.base_url
      'https://mutant-school.herokuapp.com/api/v1/mutants'
    end

    # Get all mutants from the backend
    # mutants = Mutant.all
    def self.all
      response = HTTP.get(self.base_url)
      JSON.parse response.to_s
    end

    # Get a single mutant from the backend
    # m = Mutant.find(3)
    def self.find(id)
      response = HTTP.get(self.base_url + "/#{id}")
      JSON.parse response.to_s
    end

    # Create or update a mutant in the backend
    # m.save
    def save
    end

    # Delete a mutant from the backend
    # m.destroy
    def destroy
    end
  end
end
