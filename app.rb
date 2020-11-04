require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    Bookmark.add(params[:url])# saves the user input and takes the paramater given by the user.
    redirect '/bookmarks'
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  run! if app_file == $0
end
