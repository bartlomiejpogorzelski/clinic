class PatientStatisticsController < ApplicationController

  def generate_birth_statistics
    years = Patient.all.map do |p|
      get_year_from_pesel(pesel: p.pesel)
    end
    birth_years_count = years.group_by { |year| year }.transform_values(&:count)
    @birth_years = birth_years_count.sort.to_h
    render Statistics::GenerateBirthStatisticsComponent.new(birth_years: @birth_years) 
  end
  

  private

  def get_year_from_pesel(pesel:)
    year = pesel[0, 2].to_i
    month = pesel[2, 2].to_i
    case month
    when 1..12
      year += 1900
    when 21..32
      year += 2000
      month -= 20
    end

    year
  end
end
