describe 'Interface' do
  let(:selenium_driver) { double('') }
  let(:text_field) { ScreenObject::AppElements::TextField.new(name: 'dummy') }

  context 'when interaction with text=(text) method' do
    it 'enters text into text field' do
      allow(text_field).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:send_keys).with('text').and_return('text')
      expect(text_field.text = 'text').to eq 'text'
    end
  end

  context 'when interaction with text method' do
    it 'retrieves text from text' do
      allow(text_field).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:text).and_return(true)
      expect(text_field.text).to be true
    end
  end

  context 'when interaction with clear method' do
    it 'clears the text field' do
      allow(text_field).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:clear).and_return(true)
      expect(text_field.clear).to be true
    end
  end
end
