require 'bookmark' #require bookmark.rb lib file

describe Bookmark do
  before [:each] do
    Bookmark.add("http://www.makersacademy.com")
    Bookmark.add("http://www.destroyallsoftware.com")
    Bookmark.add("http://www.google.com")


    @bookmarks = Bookmark.all
  end
  describe '.all' do
    it 'returns all bookmarks' do
      #before each method runs within here.
      expect(@bookmarks).to include("http://www.makersacademy.com")
      expect(@bookmarks).to include("http://www.destroyallsoftware.com")
      expect(@bookmarks).to include("http://www.google.com")
    end
  end

  describe '.add' do
    it 'adds to bookmark list' do
      #before each method runs within here.
      expect(@bookmarks).to include("http://www.makersacademy.com")
      expect(@bookmarks).to include("http://www.destroyallsoftware.com")
      expect(@bookmarks).to include("http://www.google.com")
    end
  end
end
