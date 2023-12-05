# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def generate_pesel
  pesel =  FFaker::IdentificationPL.pesel

  two_digits = pesel[2, 2]
  number = two_digits.to_i % 12 + 1

  pesel[2] = (number / 10).to_s
  pesel[3] = (number % 10).to_s

  pesel
end

5.times do
  # birth_date = Faker::Date.birthday(min_age: 18, max_age: 65)
  gender = Faker::Gender.binary_type

  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender:gender,
    email: Faker::Internet.email,
    pesel: generate_pesel,
    city: Faker::Address.city
  )
end

puts 'Patients created successfully.'

3.times do
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialization: Faker::Job.title,
    office_hours: '8:00 AM - 4:00 PM',
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number
  )
end

puts 'Doctors seeded successfully.'

date_range = (Date.today..(Date.today + 30)).to_a

Patient.all.each do |patient|
  Doctor.all.each do |doctor|
    appointment_date = date_range.sample.to_datetime
    appointment_date = appointment_date.change(hour: rand(8..15), min: [0, 20, 40].sample)

    unless doctor.appointments.where(appointment_date: appointment_date).exists?
      if doctor.appointments.where(patient_id: patient.id, appointment_date: appointment_date).empty?
        Appointment.create(
          patient: patient,
          doctor: doctor,
          appointment_date: appointment_date,
          price: Faker::Number.decimal(l_digits: 2)
        )
      end
    end
  end
end

puts 'Appointments created successfully.'