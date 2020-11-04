feature 'adding bookmarks' do
  scenario "user adds bookmarks to the list" do
    visit '/bookmarks/add'
    fill_in :url, with: "www.bbc.co.uk"
    click_button "submit"
    expect(page).to have_content "www.bbc.co.uk"
  end
end
