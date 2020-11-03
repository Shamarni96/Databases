require 'pg'

def setup_test_database
  con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
  con.exec("TRUNCATE bookmarks;")
end
