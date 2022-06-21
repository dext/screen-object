module ScreenObject
  module AppElements
    class Button < AppElements::Element
      def tap
        element.click
      end

      def enabled?
        element.enabled?
      rescue StandardError
        false
      end
    end
  end
end
