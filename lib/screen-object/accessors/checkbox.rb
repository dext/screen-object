module ScreenObject
  module AppElements
    class CheckBox < AppElements::Element
      def checked?
        element.attribute('checked') == 'true'
      end

      def check
        element.click unless checked?
      end

      def uncheck
        element.click if checked?
      end
    end
  end
end
