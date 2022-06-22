module ScreenObject
  module AppElements
    class Table < AppElements::Element
      def count_rows
        elements.size
      end
    end
  end
end
