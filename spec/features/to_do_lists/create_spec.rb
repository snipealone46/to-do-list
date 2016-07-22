require 'rails_helper'

describe "Creating todo lists" do
  def create_todo_list(options={})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is the default description"
    visit '/'
    click_on 'New To do list'
    expect(page).to have_content('New To Do List')

    fill_in 'Title', with: options[:title]
    fill_in 'Description', with: options[:description]
    click_button 'Create To do list'
  end

  it "redirects to the todo list index page on success" do
    create_todo_list title: 'test'
    expect(page).to have_content('test')
  end

  it "display an error when the to do list has less than 3 characters" do
    expect(ToDoList.count).to eq(0)
    create_todo_list  title: 'hi'

    expect(ToDoList.count).to eq(0)
    expect(page).to have_content("error")

    visit "/"
    expect(page).to_not have_content("hi")
  end
end
