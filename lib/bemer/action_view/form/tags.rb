# frozen_string_literal: true

module Bemer
  module ActionView
    module Form
      module Tags
        def initialize(object_name, method_name, template_object, options = {})
          extract_elem_options!(method_name, options)

          super
        end

        protected

        def extract_elem_options!(method_name, options)
          elem         = elem_name!(method_name, options)
          block_entity = options.delete(:block_entity)
          bem_options  = extract_bem_options!(block_entity, options)
          elem_entity  = Bemer::EntityBuilder.new(block_entity.block, elem, bem_options)

          options.merge!(elem_entity.attrs)
        end

        def extract_bem_options!(block_entity, options)
          bem         = options.delete(:bem)
          bem_cascade = extract_bem_cascade!(block_entity, options)
          css_classes = [options.delete(:class), options.delete(:cls)]
          js          = options.delete(:js)
          mix         = options.delete(:mix)
          mods        = options.delete(:mods)

          { bem: bem, js: js, mods: mods, mix: mix, bem_cascade: bem_cascade, cls: css_classes }
        end

        def extract_bem_cascade!(block_entity, options)
          bem_cascade = options.delete(:bem_cascade)

          bem_cascade.nil? ? block_entity.bem_cascade : bem_cascade
        end

        def elem_name!(method_name, options)
          elem = options.delete(:elem)

          elem.nil? ? method_name : elem
        end
      end
    end
  end
end
