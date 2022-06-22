module ScreenObject
  module AppElements
    class Image < AppElements::Element
      def tap
        element.click
      end
      alias click tap
    end
  end
end
