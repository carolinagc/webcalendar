require 'spec_helper'

describe ApplicationHelper do
  describe "#boolean_to_words" do
    it "should convert boolean to words" do
      expect(boolean_to_words(true)).to eq(I18n.t('base.yes'))
      expect(boolean_to_words(false)).to eq(I18n.t('base.no'))
      expect(boolean_to_words("test")).to eq(I18n.t('base.yes'))
      expect(boolean_to_words(nil)).to eq(I18n.t('base.no'))
    end
  end
end
