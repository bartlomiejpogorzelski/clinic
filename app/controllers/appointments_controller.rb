class AppointmentsController < ApplicationController

  def index
    render Appointments::AppointmentsComponent.new(appointments: Appointment.all)
  end

  def new
    @patient = Patient.find(params[:patient_id])
    render Appointments::NewAppointmentComponent.new(patient: @patient, doctors: Doctor.all, appointment: Appointment.new)
  end

  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        redirect_to patients_path
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "appointment_id",
            Appointments::NewAppointmentComponent.new(
              patient: @appointment.patient,
              doctors: Doctor.all,
              appointment: @appointment
            )
          )
        end 
      end
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :appointment_date, :price)
  end
end
