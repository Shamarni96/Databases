feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    con.exec("INSERT INTO bookmarks(url) VALUES('http://www.makersacademy.com');")
    con.exec("INSERT INTO bookmarks(url) VALUES('http://www.destroyallsoftware.com');")
    con.exec("INSERT INTO bookmarks(url) VALUES('http://www.google.com');")
    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
