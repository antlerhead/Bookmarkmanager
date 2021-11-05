# frozen_string_literal: true
require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

       # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.adobe.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.ask.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.adobe.com')
      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.ask.com')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Test Bookmark').first
      
      expect(bookmark['url']).to eq 'http://www.example.org'
      expect(bookmark['title']).to eq 'Test Bookmark'
    end
  end

end

