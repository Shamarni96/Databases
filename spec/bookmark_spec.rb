require 'bookmark' #require bookmark.rb lib file

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
      con.exec("INSERT INTO bookmarks(url) VALUES('http://www.makersacademy.com');")
      con.exec("INSERT INTO bookmarks(url) VALUES('http://www.destroyallsoftware.com');")
      con.exec("INSERT INTO bookmarks(url) VALUES('http://www.google.com');")


      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
