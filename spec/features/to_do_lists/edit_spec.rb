require 'rails_helper'

describe 'Editing to do list' do
  let!(:todo_list) { ToDoList.create(title: "Groceries", description: "Grocery list.") }
  it "updates a todo list successfully with correct information" do
     visit "/"

     within "#to_do_list_#{ todo_list.id }" do
         click_link "Edit"
     end

     fill_in "Title", with: "New title"
     fill_in "Description", with: "New description"
     click_button "Update To do list"

     todo_list.reload

     expect(page).to have_content('To do list was successfully updated')
     expect(todo_list.title).to eq("New title")
     expect(todo_list.description).to eq("New description")
  end
end
