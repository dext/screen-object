describe 'Text' do
  let(:selenium_driver) { double('') }
  let(:text) { ScreenObject::AppElements::Text.new(name: 'dummy') }

  context 'when interaction with clear method' do
    example 'clears the text field' do
      allow(text).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:text).and_return('text')
      expect(text.text).to eq 'text'
    end

    example 'clears the text field with dynamic text' do
      allow(text).to receive(:dynamic_xpath).with('dynamic_text').and_return(selenium_driver)
      allow(selenium_driver).to receive(:displayed?).and_return(selenium_driver).and_return(true)
      expect(text.dynamic_text_exists?('dynamic_text')).to be true
    end
  end
end
