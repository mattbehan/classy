require 'rails_helper'

describe StudentsController do

  describe 'teachers/:id/students' do
    it 'has information about a specific teachers students' do
      visit('/teachers/4/students')
      response.body.should have_content("students")
    end
  end

end
