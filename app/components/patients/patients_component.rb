# frozen_string_literal: true

class Patients::PatientsComponent < ViewComponent::Base
  include Ransack::Helpers::FormHelper

  attr_reader :patients, :pagy, :q

  def initialize(patients:, pagy:, q:)
    @patients = patients
    @pagy = pagy
    @q = q
  end
end
