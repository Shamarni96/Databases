feature 'updating bookmarks' do
  scenario "updating a saved bookmark" do
    bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq("/bookmarks/#{bookmark.id}/edit")

    fill_in("url", with: "http://www.snakersacademy.com")
    fill_in("title", with: "Snakers Academy")
    click_button("submit")
    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link("http://www.makersacademy.com")
    expect(page).to have_link('Snakers Academy', href: 'http://www.snakersacademy.com')
  end
end
