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

  describe '.delete' do
    it "deletes the given bookmark" do
      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")

      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it "updates the given bookmark" do
      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
      updated_bookmark = Bookmark.update(id: bookmark.id, url: "http://www.snakersacademy.com", title: "Snakers Academy")
      p bookmark
      p bookmark.id
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.url).to eq "http://www.snakersacademy.com"
      expect(updated_bookmark.title).to eq "Snakers Academy"
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end
end
