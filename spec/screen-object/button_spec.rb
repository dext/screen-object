require_relative '../spec_helper'

describe 'Interface' do

  let(:selenium_object) { double('') }
  let(:button) {ScreenObject::AppElements::Button.new(name: 'dummy')}

  describe 'interaction with tap method' do
    example 'should tap on the button' do
      expect(button).to receive(:element).and_return(selenium_object)
      expect(selenium_object).to receive(:click).and_return(true)
      expect(button.tap).to eq(true)
    end
  end

  describe 'interaction with enable method' do
    example 'should check if button is enabled' do
      expect(button).to receive(:element).and_return(selenium_object)
      expect(selenium_object).to receive(:enabled?).and_return(true)
      expect(button.enabled?).to eq(true)
    end
  end
end
