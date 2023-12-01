class PatientsController < ApplicationController
    include Pagy::Backend
    ITEMS_PER_PAGE = 5
  
  def index
    @pagy, @patients = pagy(Patient.includes(:appointments).all,  items: ITEMS_PER_PAGE)
    render Patients::PatientsComponent.new(patients: @patients,  pagy: @pagy)
  end


end
