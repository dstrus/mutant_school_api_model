module MutantSchoolAPIModel
  class Mutant

    def self.base_url
      'https://mutant-school.herokuapp.com/api/v1/mutants'
    end

    def self.attribute_names
      [
        :id,
        :mutant_name,
        :real_name,
        :power,
        :eligibility_begins_at,
        :eligibility_ends_at,
        :may_advise_beginning_at,
        :url,
        :created_at,
        :updated_at,
        :advisor
      ]
    end

    def self.read_only_attribute_names
      [
        :id,
        :url,
        :created_at,
        :updated_at,
        :advisor
      ]
    end

    # Get all mutants from the backend
    # mutants = Mutant.all
    def self.all
      response = HTTP.get(self.base_url)

      JSON.parse(response.to_s).map do |attributes_hash|
        Mutant.new attributes_hash
      end
    end

    # Get a single mutant from the backend
    # m = Mutant.find(3)
    def self.find(id)
      response = HTTP.get(self.base_url + "/#{id}")
      Mutant.new JSON.parse(response.to_s)
    end

    attr_accessor *(self.attribute_names - self.read_only_attribute_names)
    attr_reader *self.read_only_attribute_names

    def initialize(attr = {})
      # set instance variables from the things in the hash
      attr.each do |name, value|
        if self.class.attribute_names.include? name.to_sym
          instance_variable_set("@#{name}", value)
        end
      end
    end

    # Create or update a mutant in the backend
    # m.save
    def save
      if persisted?
        response = HTTP.put(self.class.base_url + "/#{@id}", json: payload)
      else
        response = HTTP.post(self.class.base_url, json: payload)
      end
    end

    def to_h
      attribute_collection = {}
      self.class.attribute_names.each do |name|
        attribute_collection[name] = send(name)
      end
      attribute_collection
    end

    # Delete a mutant from the backend
    # m.destroy
    def destroy
    end

    def persisted?
      !!@id
    end

    private

    def payload
      permitted_attributes = to_h

      # Remove read-only attributes from the hash
      permitted_attributes.keys.each do |key|
        if self.class.read_only_attribute_names.include? key
          permitted_attributes.delete(key)
        end
      end

      return { mutant: permitted_attributes }
    end
  end
end
