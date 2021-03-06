require 'spec_helper'

feature "Adding a new teacher" do
  scenario "when admin submits a valid form" do
    visit '/teachers/new'
    allow_any_instance_of(Teacher).to_receive(admin)
    # stub the games action choice
    # user chooses action
    # user sees user won and the action outcome
  end

  scenario "when admin submits a form with invalid input" do
    visit '/teachers/new'
    allow_any_instance_of(Teacher).to_receive(admin)
    # stub the games action choice
    # user chooses action
    # user sees user won and the action outcome
  end

  scenario "When a non-admin teacher submits the form" do
    visit '/teachers/new'
    allow_any_instance_of(Teacher).to_receive(admin)
  end
end

feature "Admin can remove students from classrooms" do
  scenario "an admin clicks on button to remove a student from a classroom" do

  end
end

feature "Teacher adding detention to their student" do
  scenario "when teacher clicks increment button" do

  end
end

feature "Teacher adding a student to their classroom" do
  scenario "teacher clicks add to your classroom button and student is currently not in a classroom" do

  end

  scenario "teacher tries to add a student that is already assigned to a classroom by editing the form" do

  end
end

feature "Uploading a CSV of students" do
  scenario "admin clicks the upload button with a valid CSV" do
    visit "/"
    expect{ find_by_id('save').click }.to change{Student.count }

  end
end

feature "Teacher profile" do
  scenario "Teacher is editing their own profile" do

  end

  scenario "Teacher can click on another teacher and be taken to their profile" do
    expect(page).to have_text()
  end
end
