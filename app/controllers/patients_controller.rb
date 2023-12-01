class PatientsController < ApplicationController

  def index
    @patients = Patient.includes(:appointments).all
    render Patients::PatientsComponent.new(patients: @patients)
  end


end
