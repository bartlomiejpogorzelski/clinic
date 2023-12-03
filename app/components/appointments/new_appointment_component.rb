# frozen_string_literal: true

class Appointments::NewAppointmentComponent < ViewComponent::Base
  include Turbo::StreamsHelper
  attr_reader :patient, :doctors, :appointment
  # with_model  :appointment

  def initialize(patient:, doctors:, appointment:)
    @patient = patient
    @doctors = doctors
    @appointment = appointment
  end

  
  
end
