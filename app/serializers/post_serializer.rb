class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :created_at, :updated_at

  belongs_to :user, include: :email
end
