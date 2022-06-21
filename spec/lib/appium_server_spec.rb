require 'screen-object/appium_server'

describe ScreenObject::AppiumServer do
  attr_reader :the_server

  before do
    @process = double :process
    allow(ChildProcess).to receive(:build).and_return(@process)
    allow(@process).to receive(:start)
  end

  def the_server(params = {})
    @the_server ||= ScreenObject::AppiumServer.new params
  end

  def expected_build_params(*params)
    allow(ChildProcess).to receive(:build).with(*params).and_return(@process)
  end

  context 'when starting the appium server' do
    example 'should start the appium process with no parameters' do
      expected_build_params 'appium'
      the_server.start
    end

    example 'should pass a parameter and value to the appium process' do
      expected_build_params 'appium', '--foo', 'bar'
      the_server('foo' => 'bar').start
    end

    example 'should not contain value in the server start parameter if value is nil' do
      expected_build_params 'appium', '--foo'
      the_server('foo' => nil).start
    end

    example 'should accept symbol as key for the parameter' do
      expected_build_params 'appium', '--foo', 'bar'
      the_server(foo: 'bar').start
    end

    example 'should start the server process' do
      expected_build_params 'appium'
      allow(@process).to receive(:start)
      the_server.start
    end
  end

  context 'when stopping the appium server' do
    example 'should stop the appium process' do
      the_server.start
      allow(@process).to receive(:stop)
      the_server.stop
    end
  end
end
