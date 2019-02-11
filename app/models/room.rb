class Room < ApplicationRecord
    has_many :shiritori_messages
    validates :name, uniqueness: {message: "「%{value}」はすでに存在します"}
    validates :host_user_id, uniqueness: {message: "同時に作れる部屋は一つまでです"}
end
