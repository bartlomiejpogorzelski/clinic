class Patient < ApplicationRecord
  has_many :appointments

  def self.ransackable_associations(auth_object = nil)
    ["appointments"]
    end
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "last_name", "updated_at", "pesel"]
  end

  def birth_date
    year = pesel[0, 2].to_i
    month = pesel[2, 2].to_i
    day = pesel[4, 2].to_i
  
    case month
    when 1..12
      year += 1900
    when 21..32
      year += 2000
      month -= 20
    when 41..52
      year += 2100
      month -= 40
    when 61..72
      year += 2200
      month -= 60
    when 81..92
      year += 1800
      month -= 80
    else
      return nil
    end
  
    begin
      Date.parse("#{year}-#{'%02d' % month}-#{'%02d' % day}")
    rescue Date::Error
      nil
    end
  end
end