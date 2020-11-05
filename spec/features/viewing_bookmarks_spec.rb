feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    bookmarks = Bookmark.add(url: "http://www.makersacademy.com", title: "Makers Academy")
    bookmarks = Bookmark.add(url: "http://www.destroyallsoftware.com", title: "DAS")
    bookmarks = Bookmark.add(url: "http://www.google.com", title: "Google")
    visit('/bookmarks')

    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")
    expect(page).to have_link("DAS", href: "http://www.destroyallsoftware.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
  end
end
