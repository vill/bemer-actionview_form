# frozen_string_literal: true

module Bemer
  module ActionView
    module Form
      module Builder
        def initialize(object_name, object, template, options)
          extract_block_options!(object_name, options)

          super(object_name, object, template, options)
        end

        protected

        attr_reader :block_entity

        def extract_block_options!(object_name, options)
          options ||= {}

          block = block_name!(object_name, options)

          options.delete(:elem)

          @block_entity = Bemer::EntityBuilder.new(block, extract_bem_options!(options))

          options[:block_entity] = block_entity

          options[:html].merge!(block_entity.attrs)
        end

        def extract_bem_options!(options)
          options[:html] ||= {}

          bem         = options.delete(:bem)
          bem_cascade = options.delete(:bem_cascade)
          css_classes = [options.delete(:class), options.delete(:cls), options[:html][:class]]
          js          = options.delete(:js)
          mix         = options.delete(:mix)
          mods        = options.delete(:mods)

          { bem: bem, js: js, mods: mods, mix: mix, bem_cascade: bem_cascade, cls: css_classes }
        end

        def block_name!(object_name, options)
          block = options.delete(:block)

          block.nil? ? object_name : block
        end

        private

        def objectify_options(options)
          @default_options.merge(options.merge(object: @object, block_entity: block_entity))
        end
      end
    end
  end
end
