class Quiz < ActiveRecord::Base
	has_many :questions

	validates :title, presence: true, uniqueness: true

	accepts_nested_attributes_for :questions


end

