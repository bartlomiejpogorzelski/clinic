# frozen_string_literal: true

class Appointments::RowAppointmentComponent < ViewComponent::Base
  with_collection_parameter :appointment

  attr_reader :appointment

  def initialize(appointment:)
    @appointment = appointment
  end
end
