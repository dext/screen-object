describe 'Interface' do
  let(:selenium_driver) { double('') }
  let(:image) { ScreenObject::AppElements::Image.new(name: 'dummy') }

  context 'when interaction with click method' do
    example 'clicks on element' do
      allow(image).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(image.click).to be true
    end
  end
end
