describe "Teacher" do
  before(:each) do
    @valid_teacher = Teacher.new(first_name: "David", last_name: "Campbell",
                                email: "hklucher@gmail.com",
                                password: "secure password")
    @invalid_teacher = Teacher.new
    @second_valid_teacher = Teacher.new(first_name: "Charles", last_name: "Darwin",
                                        email: "hklucher@gmail.com",
                                        password: "evolution123")
  end

  describe "#first_name" do
    it "returns the teachers first name" do
      expect(@valid_teacher.first_name).to eq("David")
    end

    it "should return nil when no first name is passed" do
      expect(@invalid_teacher.first_name).to eq(nil)
    end
  end

  describe '#last_name' do
    it "should return the teachers last name" do
      expect(@valid_teacher.last_name).to eq("Campbell")
    end

    it "should return nil when no last name is passed" do
      expect(@invalid_teacher.last_name).to eq(nil)
    end
  end

  describe '#admin' do
    it 'should default to false' do
      expect(@valid_teacher.admin).to eq(false)
    end

    it 'should have the ability to be set to true' do
      @valid_teacher.admin = true
      expect(@valid_teacher.admin).to eq(true)
    end
  end

  describe '#set_admin' do
    it 'should allow a teacher to set another teacher as an admin IF they are an admin' do
      @valid_teacher.admin = true
      @valid_teacher.set_admin(@second_valid_teacher)
      expect(@second_valid_teacher.admin).to eq(true)
    end

    it 'should not allow a teacher to set another teacher as admin IF they are not an admin' do
      @valid_teacher.set_admin(@second_valid_teacher)
      expect(@second_valid_teacher.admin).to eq(false)
    end
  end
end
