require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id  = id
    @title = title
    @url = url
  end

  def self.all
    self.environment

    data = @con.exec("SELECT * FROM bookmarks;")
    data.map do |row|
      Bookmark.new(id: row['id'], title: row['title'], url: row['url'])
    end
  end


  def self.add(url:, title:)
    self.environment

    result = @con.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    self.environment

    @con.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    self.environment

    result = @con.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    self.environment

    result = @con.exec("SELECT * FROM bookmarks WHERE id = #{id}")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  private

  def self.environment

    if ENV['RACK_ENV'] == 'test'
      @con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    else
      @con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end

  end

end
