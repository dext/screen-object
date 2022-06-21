describe 'Interface' do
  let(:selenium_object) { double('') }
  let(:button) { ScreenObject::AppElements::Button.new(name: 'dummy') }

  describe 'interaction with tap method' do
    example 'should tap on the button' do
      allow(button).to receive(:element).and_return(selenium_object)
      allow(selenium_object).to receive(:click).and_return(true)
      expect(button.tap).to be true
    end
  end

  describe 'interaction with enable method' do
    example 'should check if button is enabled' do
      allow(button).to receive(:element).and_return(selenium_object)
      allow(selenium_object).to receive(:enabled?).and_return(true)
      expect(button.enabled?).to be true
    end
  end
end
