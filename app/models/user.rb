class User < ApplicationRecord
  has_secure_password

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :description,
    presence: true,
    length: { maximum: 500 }

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :age,
    presence: true

  validates :password,
    presence: true,
    length: { minimum: 6, maximum: 25 },
    length: { maximum: 25 }

  belongs_to :city

  has_many :gossips

  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  has_many :comments
  
  has_many :likes
end