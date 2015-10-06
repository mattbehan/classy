describe "the sign up process" do
  before :each do
    Teacher.new(first_name: "Nic", last_name: "Lombardi", email: "nic.lombardi916@gmail.com",
              password: "nics password", password_confirmation: "nics password")
  end

  it "can render the sign up page" do
    visit '/teachers/sign_up'
    expect(page).to have_content('Sign up')
  end
end
