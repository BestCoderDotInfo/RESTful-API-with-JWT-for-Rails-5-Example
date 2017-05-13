# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

require 'rails_helper'

# Test suite for the Post model
RSpec.describe Post, type: :model do
  # Association test
  it { should belong_to(:user) }
  # Validation tests
  # ensure columns name and body are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:body) }
end
