# spec/i18n_keys_spec.rb

require 'spec_helper'
describe 'translation keys'  do
  let(:i18n) { I18n::Tasks::BaseTask.new }

  it 'are all present' do
    expect(i18n.untranslated_keys).to have(0).keys
  end

  it 'are all used' do
    expect(i18n.unused_keys).to have(0).keys
  end

end