# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  #   get '/bookmark' do
  #     erb :bookmark

  get '/bookmarks' do
    ENV
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  #   get '/bookmarks' do
  #     bookmarks = [
  #               "http://www.adobe.com",
  #               "http://www.google.com"
  #              ]

  #     bookmarks.join
  #     erb :bookmarks
  #   end
  run! if app_file == $PROGRAM_NAME
end
