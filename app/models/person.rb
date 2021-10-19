class Person < ApplicationRecord
    has_one :address
    accepts_nested_attributes_for :address
    validates_presence_of :name

    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |person|
                csv << person.attributes.values_at(*column_names)
            end
        end
    end       

    def self.import(file)
        spreadsheet = Roo::Spreadsheet.open(file)
        spsh = spreadsheet.sheet("default")
        header = spsh.row(1)
        (2..spsh.last_row).each do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            person = find_by_id(row["id"]) || new
            person.attributes = row.to_hash
            person.save!
        end
        
    end
end
#/home/blue/Downloads/people.csv