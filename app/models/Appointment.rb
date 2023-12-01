class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :appointment_date, presence: true
  validate :appointment_date_must_be_weekday
  validate :appointment_date_must_be_within_office_hours
  validate :appointment_duration_must_be_20_minutes
  validate :appointment_date_must_be_unique

  def appointment_date_must_be_weekday
    errors.add(:appointment_date, "Musisz wybrać dzień roboczy.") unless appointment_date.try(:wday).in?([1, 2, 3, 4, 5])
  end

  def appointment_date_must_be_within_office_hours
    errors.add(:appointment_date, "Wizyty są dostępne tylko od 8:00 do 16:00.") unless appointment_date.try(:hour).between?(8, 16)
  end

  def appointment_duration_must_be_20_minutes
    end_time = appointment_date + 20.minutes
    errors.add(:appointment_date, "Wizyta musi trwać dokładnie 20 minut.") unless end_time == Time.zone.at(end_time.to_i / 1200 * 1200)
  end

  def appointment_date_must_be_unique
    errors.add(:appointment_date, "Inny pacjent ma już wizytę o tej godzinie.") if Appointment.where(appointment_date: appointment_date).exists?
  end
end