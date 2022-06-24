require 'appium_lib'
require 'screen-object/accessors'
require 'screen-object/elements'
require 'screen-object/screen_factory'
require 'screen-object/screen_populator'
require 'screen-object/accessors/element'

# this module adds screen object when included.
# This module will add instance methods and screen object that you use to define and interact with mobile objects

module ScreenObject
  include ScreenPopulator

  def self.included(cls)
    cls.extend ScreenObject::Accessors
  end

  def driver
    ScreenObject::AppElements::Element.new('').driver
  end

  def swipe(start_x, start_y, end_x, end_y, touch_count, duration)
    driver.swipe start_x: start_x, start_y: start_y, end_x: end_x, end_y: end_y, touchCount: touch_count, duration: duration
  end

  def landscape
    driver.driver.rotate :landscape
  end

  def portrait
    driver.driver.rotate :portrait
  end

  def back
    driver.back
  end

  def wait_until(timeout = 5, message = nil, &block)
    wait = Selenium::WebDriver::Wait.new timeout: timeout, message: message
    wait.until(&block)
  end

  def wait_step(timeout = 5, message = nil, &block)
    default_wait = driver.default_wait
    wait = Selenium::WebDriver::Wait.new timeout: driver.set_wait(timeout), message: message
    wait.until(&block)
    driver.set_wait default_wait
  end

  def scroll_down_find(locator, locator_value, num_loop = 15)
    scr = driver.window_size
    scroll_start = scr.height * 0.5
    scroll_end = scr.height * 0.2
    num_loop.each do
      break if driver.find_element(locator, locator_value).displayed?
    rescue StandardError
      driver.swipe start_x: 0, start_y: scroll_start, end_x: 0, end_y: scroll_end, touchCount: 2, duration: 0
      false
    end
  end

  def scroll_down_click(locator, locator_value, num_loop = 15)
    scr = driver.window_size
    scroll_start = scr.height * 0.5
    scroll_end = scr.height * 0.2
    num_loop.each do
      if driver.find_element(locator, locator_value).displayed?
        driver.find_element(locator, locator_value).click
        break
      end
    rescue StandardError
      driver.swipe start_x: 0, start_y: scroll_start, end_x: 0, end_y: scroll_end, touchCount: 2, duration: 0
      false
    end
  end

  def scroll_up_find(locator, locator_value, num_loop = 15)
    scr = driver.window_size
    scroll_start = scr.height * 0.5
    scroll_end = scr.height * 0.2
    num_loop.each do
      break if driver.find_element(locator, locator_value).displayed?
    rescue StandardError
      driver.swipe start_x: 0, start_y: scroll_end, end_x: 0, end_y: scroll_start, touchCount: 2, duration: 0
      false
    end
  end

  def scroll_up_click(locator, locator_value, num_loop = 15)
    scr = driver.window_size
    scroll_start = scr.height * 0.5
    scroll_end = scr.height * 0.2
    num_loop.each do
      if driver.find_element(locator, locator_value).displayed?
        driver.find_element(locator, locator_value).click
        break
      end
    rescue StandardError
      driver.swipe start_x: 0, start_y: scroll_end, end_x: 0, end_y: scroll_start, touchCount: 2, duration: 0
      false
    end
  end

  def drag_and_drop_element(source_locator, source_locator_value, target_locator, target_locator_value)
    l_draggable = driver.find_element source_locator, source_locator_value
    l_droppable = driver.find_element target_locator, target_locator_value
    obj1 = Appium::TouchAction.new
    obj1.long_press(x: l_draggable.location.x, y: l_draggable.location.y).move_to(x: l_droppable.location.x, y: l_droppable.location.y).release.perform
  end

  def keyboard_hide
    driver.hide_keyboard
  rescue StandardError
    false
  end
end
