require_relative '../spec_helper'

describe 'Element' do

  let(:selenium_driver) {double('')}
  let(:element) {ScreenObject::AppElements::Element.new(name: 'dummy')}

  describe 'interaction with click method' do
    example 'should click on element' do
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.click).to be true
    end
  end

  describe 'interaction with value method' do
    example 'should return value' do
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:value).and_return('value')
      expect(element.value).to eql ('value')
    end
  end

  describe 'interaction with exists? method' do
    example 'should return value' do
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:displayed?).and_return(true)
      expect(element.exists?).to eql (true)
    end
  end

  describe 'interaction with element method' do
    example 'should return element object' do
      expect(element).to receive(:driver).and_return(selenium_driver)
      expect(selenium_driver).to receive(:find_element).and_return(selenium_driver)
      expect(element.element).to eql (selenium_driver)
    end
  end

  describe 'interaction with element method' do
    example 'should return element object' do
      expect(element).to receive(:driver).and_return(selenium_driver)
      expect(selenium_driver).to receive(:find_elements).and_return(selenium_driver)
      expect(element.elements).to eql (selenium_driver)
    end
  end

  describe 'interaction with element method' do
    example 'should return element object' do
      expect(element).to receive(:dynamic_xpath).and_return(selenium_driver)
      expect(selenium_driver).to receive(:displayed?).and_return(true)
      expect(element.dynamic_text_exists?('dynamic_text')).to eql (true)
    end
  end

   # describe "interaction with scroll method" do
   #   it "should return element object" do
   #     expect(element).to receive(:driver).and_return(selenium_driver)
   #     expect(selenium_driver).to receive(:execute_script).and_return(selenium_driver)
   #     expect(element.scroll).to eql (selenium_driver)
   #   end
   # end

  describe 'interaction with scroll_for_element_click method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:displayed?).and_return(true)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.scroll_for_element_click).to eql (true)
    end
  end

  describe 'interaction with scroll_for_element_click method' do
    example 'should scroll for element and click..' do
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:displayed?).and_return(false)
      expect(element).to receive(:scroll).and_return(selenium_driver)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.scroll_for_element_click).to eql (true)
    end
  end

  describe 'interaction with scroll_for_dynamic_element_click method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:dynamic_xpath).with('expected_text').and_return(selenium_driver)
      expect(selenium_driver).to receive(:displayed?).and_return(true)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.scroll_for_dynamic_element_click('expected_text')).to eql (true)
    end
  end

  describe 'interaction with scroll_for_dynamic_element_click method' do
    example 'should scroll for element and click..' do
      expect(element).to receive(:dynamic_xpath).with('expected_text').and_return(selenium_driver)
      expect(selenium_driver).to receive(:displayed?).and_return(false)
      expect(element).to receive(:scroll).and_return(selenium_driver)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.scroll_for_dynamic_element_click('expected_text')).to eql (true)
    end
  end

  describe 'interaction with click_text method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:exists?).and_return(true)
      expect(element).to receive(:click).and_return(true)
      expect(element.click_text('text')).to eq (true)
    end
  end

  describe 'interaction with click_text method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:exists?).and_return(false)
      expect(element).to receive(:scroll_to_text).with('text').and_return(selenium_driver)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_text('text')).to eq (true)
    end
  end

  describe 'interaction with click_dynamic_text method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:dynamic_text_exists?).with('text').and_return(true)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_dynamic_text('text')).to eq (true)
    end
  end

  describe 'interaction with click_dynamic_text method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:dynamic_text_exists?).with('text').and_return(false)
      expect(element).to receive(:scroll_to_text).with('text').and_return(selenium_driver)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_dynamic_text('text')).to eq (true)
    end
  end


  describe 'interaction with click_exact_text method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:exists?).and_return(true)
      expect(element).to receive(:click).and_return(true)
      expect(element.click_exact_text('text')).to eq (true)
    end
  end

  describe 'interaction with click_exact_text method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:exists?).and_return(false)
      expect(element).to receive(:scroll_to_exact_text).with('text').and_return(selenium_driver)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_exact_text('text')).to eq (true)
    end
  end

  describe 'interaction with click_dynamic_exact_text method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:dynamic_text_exists?).with('text').and_return(true)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_dynamic_exact_text('text')).to eq (true)
    end
  end

  describe 'interaction with click_exact_text method' do
    example 'should click on object if it does exists on the first page' do
      expect(element).to receive(:dynamic_text_exists?).with('text').and_return(false)
      expect(element).to receive(:scroll_to_exact_text).with('text').and_return(selenium_driver)
      expect(element).to receive(:element).and_return(selenium_driver)
      expect(selenium_driver).to receive(:click).and_return(true)
      expect(element.click_dynamic_exact_text('text')).to eq (true)
    end
  end
end



