require 'rails_helper'

describe "Creating todo lists" do
  it "redirects to the todo list index page on success" do
     visit '/'
     click_on 'New To do list'
     expect(page).to have_content('New To Do List')

     fill_in 'Title', with: 'test'
     fill_in 'Description', with: 'test'
     click_button 'Create To do list'

     expect(page).to have_content('test')
  end

  it "display an error when the to do list has less than 3 characters" do
     expect(ToDoList.count).to eq(0)
     visit '/'
     click_on 'New To do list'
     expect(page).to have_content('New To Do List')

     fill_in 'Title', with: 'hi'
     fill_in 'Description', with: 'hi'
     click_button 'Create To do list'

     expect(ToDoList.count).to eq(0)
     expect(page).to have_content("error")

     visit "/"
     expect(page).to_not have_content("hi")
  end
end
