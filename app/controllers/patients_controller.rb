class PatientsController < ApplicationController
  include Pagy::Backend
  ITEMS_PER_PAGE = 10
  
  def index
    q = Patient.includes(:appointments).all.ransack(params[:q])
    @pagy, @patients = pagy(q.result, items: ITEMS_PER_PAGE)
    render Patients::PatientsComponent.new(patients: @patients, pagy: @pagy, q: q)
  end

  def show
    @patient = Patient.find(params[:id])
    render Patients::PatientDetailsComponent.new(patient: @patient)
  end

end
