module Grocery
  require 'csv'

  class Customer
    attr_accessor :id, :email, :address
    def initialize(id, email, address)
      @id = id.to_i
      @email = email
      @address = address
    end

    def self.all
      all_customers = []
      CSV.open("support/customers.csv", 'r').each do |line|
        id = line[0].to_i
        email = line[1]
        address = "#{line[2]} #{line[3]}, #{line[4]} #{line[5]}"
        all_customers << self.new(id, email, address)
      end
      return all_customers
    end

    def self.find(id)
      self.all.each do |customer|
        if id == customer.id
          return customer
        end
      end
      raise ArgumentError.new ("Invalid Customer ID")
    end

  end # end of class
end # end of modeule
