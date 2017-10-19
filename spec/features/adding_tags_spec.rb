require 'spec_helper'

feature 'Tags' do
  scenario 'I add a tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'www.googlie.com'
    fill_in 'title', with: 'Googlieasdf'
    fill_in 'tags', with: 'search'
    click_button 'Create link'
    link = Link.first

    expect(link.tags.map(&:name)).to include('search')
  end

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: 'education ruby'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end
end
