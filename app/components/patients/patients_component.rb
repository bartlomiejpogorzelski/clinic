# frozen_string_literal: true

class Patients::PatientsComponent < ViewComponent::Base

  attr_reader :patients, :pagy

  def initialize(patients:, pagy:)
    @patients = patients
    @pagy = pagy
  end
end
