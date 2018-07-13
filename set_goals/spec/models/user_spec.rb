# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
requre 'spec_helper'

RSpec.describe User, type: :model do
  describe UserModel do
    it 'validates presence of username' do
    end

    it 'validates presence of password digest' do
    end

    it 'validates presence of password' do
    end
  end
end
