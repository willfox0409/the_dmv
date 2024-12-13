class Registrant 
    attr_reader :name, :age, :permit, :license_data

    def initialize(name, age, permit)
        @name = name
        @age = age 
        @permit = false 
        @license_data = license_data
    end
end