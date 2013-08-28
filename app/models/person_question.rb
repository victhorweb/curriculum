class PersonQuestion < ActiveRecord::Base
  attr_accessible :essay_id, :person_id, :replay, :vacant_id

  belongs_to :essay
  belongs_to :person
  belongs_to :vacant
end
