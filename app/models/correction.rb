class Correction < ActiveRecord::Base
  attr_accessible  :validing, :number, :person_question_id

  validates :validing, presence: true
  validates :number, presence: true
  validates :person_question_id, presence: true

  belongs_to :person_question
end