module ScreenObject
  module AppElements
    class Element
      attr_reader :locator

      def initialize(locator)
        case locator
        when String
          warn "#{DateTime.now.strftime '%F %T'} WARN ScreenObject Element [DEPRECATION] Passing the locator as a single string
                with locator type and value separated by ~ is deprecated and will no longer work in version 1.0.6.
                Use a hash instead (ex: button(:login, id: 'button_id') lib/screen-object/accessors/element.rb:#{__LINE__}"
          @locator = locator.split '~'
        when Hash
          @locator = locator.first
        else
          raise "Invalid locator type: #{locator.class}"
        end
      end

      def driver
        $driver
      end

      def click
        element.click
      end

      def value
        element.value
      end

      def exists?
        element.displayed?
      rescue StandardError
        false
      end

      def element
        driver.find_element :"#{locator[0]}", locator[1]
      end

      def elements
        driver.find_elements :"#{locator[0]}", locator[1]
      end

      def element_attributes
        %w(name resource-id value text)
      end

      def dynamic_xpath(text)
        concat_attribute = []
        element_attributes.each { |i| concat_attribute << %(contains(@#{i}, '#{text}')) }
        puts "//#{locator[0]}[#{concat_attribute.join ' or '}]"
        locator1 = "xpath~//#{locator[0]}[#{concat_attribute.join ' or '}]"
        @locator = locator1.split '~'
        element
      end

      def dynamic_text_exists?(dynamic_text)
        dynamic_xpath(dynamic_text).displayed?
      rescue StandardError
        false
      end

      def scroll
        driver.execute_script 'mobile: scrollTo', element: element.ref
        # driver.execute_script("mobile: scroll",:direction => direction.downcase, :element => element.ref)
      end

      def scroll_to_text(text)
        driver.scroll_to text
      end

      def scroll_to_exact_text(text)
        driver.scroll_to_exact text
      end

      def scroll_for_element_click
        if element.displayed?
          element.click
        else
          scroll
          element.click
        end
      end

      def scroll_for_dynamic_element_click(expected_text)
        if dynamic_xpath(expected_text).displayed?
          element.click
        else
          scroll
          element.click
        end
      end

      def click_text(text)
        if exists?
          click
        else
          scroll_to_text text
          element.click
        end
      end

      def click_dynamic_text(text)
        if dynamic_text_exists? text
          element.click
        else
          scroll_to_text text
          element.click
        end
      end

      def click_exact_text(text)
        if exists?
          click
        else
          scroll_to_exact_text text
          element.click
        end
      end

      def click_dynamic_exact_text(text)
        if dynamic_text_exists? text
          element.click
        else
          scroll_to_exact_text text
          element.click
        end
      end
    end
  end
end
