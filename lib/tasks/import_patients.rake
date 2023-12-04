require 'csv'

namespace :import do
  desc "Import patients from CSV"
  task patients: :environment do # :load_config?
    file_path = Rails.root.join('lib', 'tasks', 'data', 'fake_medical_patients.csv') 
    csv_text = File.read(file_path)
    csv = CSV.parse(csv_text, headers: true)

    csv.each do |row|
      Patient.create!(
        first_name: row['first_name'],
        last_name: row['last_name'],
        pesel: row['pesel'],
        city: row['city']
      )
    end

    puts "Success import"
  end
end
#rails import:tasks
