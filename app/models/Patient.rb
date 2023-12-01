class Patient < ApplicationRecord
  has_many :appointments

  def self.ransackable_associations(auth_object = nil)
    ["appointments"]
    end
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "last_name", "updated_at", "pesel"]
  end
end