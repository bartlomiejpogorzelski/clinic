# frozen_string_literal: true

class FlashComponent < ViewComponent::Base

  attr_accessor :type, :data

  def initialize(type:, data:)
    @type = type
    @data = prepare_data(data)
    @data[:timeout] ||= 3
  end

  private

  def prepare_data(data)
    case data
    when Hash then data
    else
      {title: data}
    end
  end

end

