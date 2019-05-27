# frozen_string_literal: true

require 'bemer'
require 'active_support/dependencies/autoload'
require 'active_support/lazy_load_hooks'

module Bemer
  module ActionView
    module Form
      extend ActiveSupport::Autoload

      autoload :Builder
      autoload :Tags
    end
  end
end

ActiveSupport.on_load :action_view do
  ::ActionView::Helpers::FormBuilder.send :prepend, Bemer::ActionView::Form::Builder
  ::ActionView::Helpers::Tags::Base.send :prepend, Bemer::ActionView::Form::Tags
end
