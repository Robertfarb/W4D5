# == Schema Information
#
# Table name: goals
#
#  id         :bigint(8)        not null, primary key
#  goal_name  :string           not null
#  body       :string           not null
#  private    :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

class Goal < ApplicationRecord
  validates :goal_name, :body, :private, null: false

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User
end
