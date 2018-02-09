require 'csv'
class Product < ApplicationRecord
def self.to_csv(column_names, products,options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes
    end
  end
end
end
