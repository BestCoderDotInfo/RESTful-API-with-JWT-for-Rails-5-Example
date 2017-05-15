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

FactoryGirl.define do
  factory :post do
    association :user, factory: :'user'
    name { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
  end
end
