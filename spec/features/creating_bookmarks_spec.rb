feature 'adds a new bookmark' do
    scenario 'user can add a new bookmark' do
        visit '/bookmarks/new'
        fill_in 'url', with: 'http//www.etsy.com'
        fill_in 'title', with: 'etsy'
        click_button 'Submit'
        expect(page).to have_link 'etsy', href:'http//:www.etsy.com'
    end
end