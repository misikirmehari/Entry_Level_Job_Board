require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a users to signup' do

    # Visit the home page
    visit root_path


    # Expect the home pge to have a signup link
    expect(page).to have_link('Signup')

    # the signup up link should be clicked
    click_link 'Signup'


    # Fill in the fields with the following
    fill_in 'First Name', with: 'bob'
    fill_in 'Last Name', with: 'smith'
    fill_in 'Email', with: 'bob@smith.com'
    fill_in 'Password', with: 'sup3rs3krit'
    fill_in 'Password Confirmation', with: 'sup3rs3krit'

    #The Click button should be clicked
    click_button 'Signup'

    # When the signup button is clicked expect the page to have the following
    # Message
    expect(page).to have_text('Thank you for signing up Bob')
    expect(page).to have_text('Signed in as bob@smith.com')

  end

  scenario 'Allows existing users to login' do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link ('Login')

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password



    click_button 'Login'

    expect(page).to have_text("Welcome back #{user.first_name.titleize}")

    # Make sure the page knows who is logged in
    expect(page).to have_text("Signed in as #{user.email}")
  end

  scenario 'disallows an existing user to login with bad password ' do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link ('Login')


    fill_in 'email', with: user.email
    fill_in 'password', with: 'Not_Your_Password'

    click_button('Login')

    expect(page).to have_text('Invalid email or password')

  end

  scenario 'Allows a logged in  user to logout ' do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link ('Login')

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password


    click_button 'Login'

    expect(page).to have_text("Welcome back #{user.first_name.titleize}")

    # Make sure the page knows who is logged in
    expect(page).to have_text("Signed in as #{user.email}")

    expect(page).to have_link ('Logout')

    click_link('Logout')

    expect(page).to have_text("#{user.email} has been logged out")

    expect(page).to_not have_text("Welcome back #{user.first_name.titleize}")

    # Make sure the page knows who is logged in
    expect(page).to_not have_text("Signed in as #{user.email}")
  end



end

