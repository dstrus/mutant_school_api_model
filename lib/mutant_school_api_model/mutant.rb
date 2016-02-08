module MutantSchoolAPIModel
  class Mutant

    # Get all mutants from the backend
    # mutants = Mutant.all
    def self.all
      response = HTTP.get('https://mutant-school.herokuapp.com/api/v1/mutants')
      JSON.parse response.to_s
    end

    # Get a single mutant from the backend
    # m = Mutant.find(3)
    def self.find(id)
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
