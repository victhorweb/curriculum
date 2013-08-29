class PersonQuestion < ActiveRecord::Base
  attr_accessible :essay_id, :person_id, :replay, :vacant_id

    validates :essay_id, presence: true
    validates :person_id, presence: true
    validates :replay, presence: true
    validates :vacant_id, presence: true

  belongs_to :essay
  belongs_to :person
  belongs_to :vacant

  has_many :corrections
end