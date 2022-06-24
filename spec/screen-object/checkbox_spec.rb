describe 'Checkbox' do
  let(:selenium_object) { double('') }
  let(:check_box) { ScreenObject::AppElements::CheckBox.new(name: 'dummy') }

  context 'when interaction with checked method' do
    example 'should return true if checked?' do
      allow(check_box).to receive(:element).and_return(selenium_object)
      allow(selenium_object).to receive(:attribute).with('checked').and_return('true')
      expect(check_box.checked?).to be true
    end
  end

  context 'when interaction with check method' do
    example 'should check the element' do
      allow(check_box).to receive(:element).and_return(selenium_object)
      allow(selenium_object).to receive(:click).and_return(true)
      allow(check_box).to receive(:checked?).and_return(false)
      expect(check_box.check).to be true
    end
  end

  context 'when interaction with uncheck method' do
    example 'should uncheck the element' do
      allow(check_box).to receive(:element).and_return(selenium_object)
      allow(selenium_object).to receive(:click).and_return(true)
      allow(check_box).to receive(:checked?).and_return(true)
      expect(check_box.uncheck).to be true
    end
  end
end
