# frozen_string_literal: true

class Appointments::AppointmentsComponent < ViewComponent::Base

  attr_reader :appointments

  def initialize(appointments:)
    @appointments = appointments
  end

end
