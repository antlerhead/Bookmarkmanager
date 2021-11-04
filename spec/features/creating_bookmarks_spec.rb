feature 'adds a new bookmark' do
    scenario 'user can add a new bookmark' do
        visit '/bookmarks/new'
        fill_in 'url', with: 'http//:www.etsy.com'
        click_button 'Submit'
        expect(page).to have_content 'http//:www.etsy.com'
    end
end