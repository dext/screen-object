require_relative '../spec_helper'

describe 'Interface' do

  let(:selenium_driver) {double('')}
  let(:image) {ScreenObject::AppElements::Image.new(name: 'dummy')}

  context 'interaction with click method' do
    it 'should click on element' do
      expect(image).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(image.click).to be true
    end
  end
end



