class Transaction < ActiveRecord::Base
	validates :requester, :requested_book, :requested, presence: true
end
