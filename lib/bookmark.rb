require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end

    url = []
    data = con.exec("SELECT * FROM bookmarks;")
    data.each do |row|
      url << row['url']#pushes every entry of url column from database into the array
    end
    url
  end
end
