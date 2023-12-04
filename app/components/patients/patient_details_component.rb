# frozen_string_literal: true

class Patients::PatientDetailsComponent < ViewComponent::Base

  attr_reader :patient, :appointments

  def initialize(patient:)
    @patient = patient
    @appointments = patient.appointments
  end

end
