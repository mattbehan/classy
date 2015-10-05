describe "Teacher" do
  before(:each) do
    @valid_teacher = Teacher.new(first_name: "David", last_name: "Campbell",
                                admin: false, email: "hklucher@gmail.com",
                                password: "secure password")
    @invalid_teacher = Teacher.new
  end

  describe "#first_name" do
    it "returns the teachers first name" do
      expect(teacher.first_name).to eq("David")
    end

    it "should return nil when no first name is passed" do
      expect(invalid_teacher.first_name).to eq(nil)
    end
  end
end
