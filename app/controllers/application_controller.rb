class ApplicationController < ActionController::Base
  include Turbo::Streams

  append_view_path Rails.root.join("app", "components")

end
