# frozen_string_literal: true

class Statistics::GenerateBirthStatisticsComponent < ViewComponent::Base
  
  attr_accessor :birth_years

  def initialize(birth_years:)
    @birth_years = birth_years
  end

  private
  def chart_data
    birth_years.map { |year, count| [year.to_s, count] }
  end
end