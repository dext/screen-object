require 'childprocess'

# This class is designed to start and stop the appium server process. In order to use
# it you must have appium and node installed on your computer. You can pass parameters
# to appium at startup via the constructor.
module ScreenObject
  class AppiumServer
    attr_accessor :process

    def initialize(params = {})
      @params = params
    end

    #
    # Start the appium server
    #
    def start
      @process = ChildProcess.build(*parameters)
      process.start
    end

    #
    # Stop the appium server
    #
    def stop
      process.stop
    end

    private

    def parameters
      cmd = ['appium']
      @params.each do |key, value|
        cmd << "--#{key}"
        cmd << value.to_s if !value.nil? && value.size.positive?
      end
      cmd
    end
  end
end
