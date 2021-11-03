# frozen_string_literal: true
# require 'spec_helper'

require 'pg'

feature 'views bookmarks' do
  scenario 'user views list of bookmarks' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'user views list of bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.adobe.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.ask.com');")

    visit '/bookmarks'
    expect(page).to have_content 'http://www.adobe.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.ask.com'
  end
end
