module ScreenObject
  module AppElements
    class Text < AppElements::Element
      def text
        element.text
      end

      def click
        element.click
      end

      def dynamic_text_exists?(dynamic_text)
        dynamic_xpath(dynamic_text).displayed?
      rescue StandardError
        false
      end

      def dynamic_text(dynamic_text)
        dynamic_xpath(dynamic_text).displayed?
        text
      rescue StandardError
        false
      end
    end
  end
end
