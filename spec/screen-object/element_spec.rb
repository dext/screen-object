describe 'Element' do
  let(:selenium_driver) { double('') }
  let(:element) { ScreenObject::AppElements::Element.new(name: 'dummy') }

  describe 'interaction with click method' do
    example 'should click on element' do
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.click).to be true
    end
  end

  describe 'interaction with value method' do
    example 'should return value' do
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:value).and_return('value')
      expect(element.value).to eql('value')
    end
  end

  describe 'interaction with exists? method' do
    example 'should return value' do
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:displayed?).and_return(true)
      expect(element.exists?).to be(true)
    end
  end

  describe 'interaction with element method' do
    example 'should return element object' do
      allow(element).to receive(:driver).and_return(selenium_driver)
      allow(selenium_driver).to receive(:find_element).and_return(selenium_driver)
      expect(element.element).to eql(selenium_driver)
    end
  end

  describe 'interaction with elements method' do
    example 'should return element object' do
      allow(element).to receive(:driver).and_return(selenium_driver)
      allow(selenium_driver).to receive(:find_elements).and_return(selenium_driver)
      expect(element.elements).to eql(selenium_driver)
    end
  end

  describe 'interaction with dynamic xpath method' do
    example 'should return element object' do
      allow(element).to receive(:dynamic_xpath).and_return(selenium_driver)
      allow(selenium_driver).to receive(:displayed?).and_return(true)
      expect(element.dynamic_text_exists?('dynamic_text')).to be(true)
    end
  end

  describe 'interaction with scroll method' do
    example 'should return element object' do
      allow(element).to receive(:driver).and_return(selenium_driver)
      allow(selenium_driver).to receive(:execute_script).and_return(selenium_driver)
      # expect(element.scroll).to eql(selenium_driver)
    end
  end

  describe 'interaction with scroll_for_element_click method' do
    example 'should click on object if it does exists on the first page' do
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:displayed?).and_return(true)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.scroll_for_element_click).to be(true)
    end

    example 'should scroll for element and click' do
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:displayed?).and_return(false)
      allow(element).to receive(:scroll).and_return(selenium_driver)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.scroll_for_element_click).to be(true)
    end
  end

  describe 'interaction with scroll_for_dynamic_element_click method' do
    example 'should click on object if it does exists on the first page' do
      allow(element).to receive(:dynamic_xpath).with('expected_text').and_return(selenium_driver)
      allow(selenium_driver).to receive(:displayed?).and_return(true)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.scroll_for_dynamic_element_click('expected_text')).to be(true)
    end

    example 'should scroll for element and click..' do
      allow(element).to receive(:dynamic_xpath).with('expected_text').and_return(selenium_driver)
      allow(selenium_driver).to receive(:displayed?).and_return(false)
      allow(element).to receive(:scroll).and_return(selenium_driver)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.scroll_for_dynamic_element_click('expected_text')).to be(true)
    end
  end

  describe 'interaction with click_text method' do
    example 'should click on object if it does exists on the first page' do
      allow(element).to receive(:exists?).and_return(true)
      allow(element).to receive(:click).and_return(true)
      expect(element.click_text('text')).to be(true)
    end

    example 'should click on object if it does not exists on the first page' do
      allow(element).to receive(:exists?).and_return(false)
      allow(element).to receive(:scroll_to_text).with('text').and_return(selenium_driver)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_text('text')).to be(true)
    end
  end

  describe 'interaction with click_dynamic_text method' do
    example 'should click on object if it does exists on the first page' do
      allow(element).to receive(:dynamic_text_exists?).with('text').and_return(true)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_dynamic_text('text')).to be(true)
    end

    example 'should click on object if it does not exists on the first page' do
      allow(element).to receive(:dynamic_text_exists?).with('text').and_return(false)
      allow(element).to receive(:scroll_to_text).with('text').and_return(selenium_driver)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_dynamic_text('text')).to be(true)
    end
  end

  describe 'interaction with click_exact_text method' do
    example 'should click on object if it does exists on the first page' do
      allow(element).to receive(:exists?).and_return(true)
      allow(element).to receive(:click).and_return(true)
      expect(element.click_exact_text('text')).to be(true)
    end

    example 'should click on object if it does not exists on the first page' do
      allow(element).to receive(:exists?).and_return(false)
      allow(element).to receive(:scroll_to_exact_text).with('text').and_return(selenium_driver)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_exact_text('text')).to be(true)
    end
  end

  describe 'interaction with click_dynamic_exact_text method' do
    example 'should click on object if it does exists on the first page' do
      allow(element).to receive(:dynamic_text_exists?).with('text').and_return(true)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_dynamic_exact_text('text')).to be(true)
    end

    example 'should click on object if it does not exists on the first page' do
      allow(element).to receive(:dynamic_text_exists?).with('text').and_return(false)
      allow(element).to receive(:scroll_to_exact_text).with('text').and_return(selenium_driver)
      allow(element).to receive(:element).and_return(selenium_driver)
      allow(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_dynamic_exact_text('text')).to be(true)
    end
  end
end
