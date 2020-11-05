require 'bookmark' #require bookmark.rb lib file
require 'database_spec_helper'

describe Bookmark do
   # before [:each] do
   #   # Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
   #   # Bookmark.add(url: "http://www.destroyallsoftware.com", title: "DAS")
   #   # Bookmark.add(url: "http://www.google.com", title: "Google")
   #   @bookmarks = Bookmark.all
   # end
  describe '.all' do
    it 'returns all bookmarks' do
      #before each method runs within here.
      connection = PG.connect(dbname: 'bookmark_manager_test')

       # Add the test data
      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.add(url: "http://www.destroyallsoftware.com", title: "DAS")
      Bookmark.add(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

    end
  end

  describe '.add' do
    it 'adds to bookmark list' do
      #before each method runs within here.
      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.url).to eq "http://www.makersacademy.com"
      expect(bookmark.title).to eq "Makers Academy"
    end
  end
end
