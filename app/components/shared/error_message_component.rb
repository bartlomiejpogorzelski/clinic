# frozen_string_literal: true

class Shared::ErrorMessageComponent < ViewComponent::Base
    attr_reader :errors

    def initialize(errors:)
      @errors = Array.wrap(errors)
    end
  end

