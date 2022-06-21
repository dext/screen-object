module ScreenObject
  module AppElements
    class TextField < AppElements::Element
      def text=(text)
        element.send_keys text
      end

      def text
        element.text
      end

      def clear
        element.clear
      end

      def enabled?
        element.enabled?
      rescue StandardError
        false
      end
    end
  end
end
