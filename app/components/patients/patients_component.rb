# frozen_string_literal: true

class Patients::PatientsComponent < ViewComponent::Base

  attr_reader :patients

  def initialize(patients:)
    @patients = patients
  end
end
