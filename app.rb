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
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  # post '/bookmarks' do
  #   # p params
  #   # p "Form data submitted to the /bookmarks route!"
  #   url = params['url']
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  #   redirect '/bookmarks'
  # end
  
  post '/bookmarks' do
    Bookmarks.create(url: params[:url])
    redirect '/bookmarks'
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
