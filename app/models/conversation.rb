class Conversation < ActiveRecord::Base
  include Owned

  has_many :participants, dependent: :destroy
  has_many :contacts, through: :participants

  grant(:find, :create, :update, :destroy) { |user, model, action| model.owned_by? user }
end
