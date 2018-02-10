require 'csv'
class Userrolemap < ApplicationRecord
def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |detail|
      csv << detail.attributes
    end
  end
end
end
