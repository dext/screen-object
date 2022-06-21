require 'screen-object/appium_server'

describe ScreenObject::AppiumServer do
  let(:the_server) { ScreenObject::AppiumServer.new }

  context 'when appium server is started' do
    example 'should start the appium server as a process' do
      the_server.start
      the_pid = the_server.process.pid
      expect(the_server.process).to be_running_process
      Process.kill 9, the_pid
    end

    example 'should be stopped when exiting' do
      the_server.start

      the_server.stop
      expect(the_server.process).not_to be_running_process
    end
  end
end
