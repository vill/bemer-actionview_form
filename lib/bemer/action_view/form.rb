# frozen_string_literal: true

require 'bemer'
require 'active_support/dependencies/autoload'

module Bemer
  module ActionView
    module Form
      extend ActiveSupport::Autoload

      autoload :Builder
      autoload :Tags
    end
  end
end
