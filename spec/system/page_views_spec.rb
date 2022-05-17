require 'rails_helper'

RSpec.describe 'PageViews' do
  it 'shows the number of page views' do
    visit '/welcome'
    expect(page.text).to match(/This page has been viewd [0-9]+ times!/)
  end
end