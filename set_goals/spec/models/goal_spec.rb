require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:goal_name)}
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:private)}
    it {should validate_presence_of(:user_id)}
  end

  it "has an owner" do
    stella = User.find_by(username: "stellafarb")
    expect(stella.goals).to eq([harry, hermy, ron])
  end



end
