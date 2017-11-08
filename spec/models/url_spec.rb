require 'rails_helper'

RSpec.describe Url, type: :model do
  before do
    @url = Url.create(url: 'https://www.yahoo.com')
  end

  it 'grab same url' do
    expect(@url.url).to eq('https://www.yahoo.com')
  end

  it 'cannot create same url' do
    new_url = Url.new(url: 'https://www.yahoo.com')
    expect(new_url.valid?).to be_falsy
  end

  it 'makes new short_url (24 * (4/3) letters)' do
    letters = 24 * 4 / 3
    expect(@url.short_url).to be_a(String)
    expect(@url.short_url.size).to be(letters)
  end

  it 'has unique short_url (2 urls)' do
    new_url = Url.create(url: 'https://www.yahoo.com.hk')
    expect(@url.short_url).not_to eq(new_url.short_url)
  end

  it 'has unique short_url and unique 1001 array(1000 urls test)' do
    epochs = 1000
    short_urls = [@url.short_url]
    urls = [@url.url]
    epochs.times do |n|
      new_url = Url.create(url: "https://www_#{n}.yahoo.com.hk")
      short_urls << new_url.short_url
      urls << new_url.url
      expect(@url.short_url).not_to eq(new_url.short_url)
    end
    expect(urls.uniq.size).to be(epochs + 1)
    expect(short_urls.uniq.size).to be(epochs + 1)
  end
end
