require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(first_name: 'Josh', last_name: 'Brook', email: 'jb@gmail.com', password:'123456', password_confirmation:'123456');
    @user.save!
  end

  scenario "User can click login button, put in credentials, and redirect to homepage" do
    
    visit root_path

    expect(page).to have_content 'Login'

    page.find('.login').click

    expect(page).to have_content 'Email'
    
    
    fill_in 'email', with: 'jb@gmail.com'
    fill_in 'password', with: '123456'

    click_button 'Submit'
    expect(page).to have_content 'Logout'
    save_screenshot
  end


end
