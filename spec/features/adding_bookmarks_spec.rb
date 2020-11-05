feature 'adding bookmarks' do
  scenario "user adds bookmarks to the list" do
    visit '/bookmarks/add'
    fill_in :url, with: "http://www.makersacademy.com"
    fill_in :title, with: "Makers Academy"
    click_button "submit"
    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")
  end
end
