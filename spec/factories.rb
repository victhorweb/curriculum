FactoryGirl.define do
  factory :universities, class:University do
    name 'Jao'
    state_id 1
    city_id 1
    phone '(18)3631-2810'
    address '87878787'
    district 'district'
    zip_code '16032-301'
  end

  factory :courses, class:Course do
    name 'engenhacao da computaria'
    description 'simplismente foda'
  end

  factory :person, class:Person do
    name 'developer'
    phone '(18)3631-2810'
    mobile_phone '(18)9604-1211'
    university_id University.first
    course_id Course.first
    semester 1
    state_id 1
    city_id 1
    work true
    video_conf 'victhor@victhor.com'
    curriculum ' testebnv '
    sector_id 1
   # image 'testando.jpg'
    image_file_name File.new(Rails.root + 'spec/fixtures/images/img.jpg')
    email "victhor@victhor.com"
  end


  factory :sector, class:Sector do
    description "testado loucamente"
    name "testando"
  end

  factory :vacant, class:Vacant do
    title 'developer'
    description 'description vacants'
    date_end Date.today
    sector_id 1
  end

  factory :skill, class:Skill do
    name 'ruby'
    description 'ruby language'
    sector_id 1
    score 0.to_f
  end

  factory :person_question, class:PersonQuestion do
    essay_id 1
    person_id 1
    replay 'exemplo'
    vacant_id 1
  end

  factory :user, class:User do
    email 'developer@developer.com'
    password '123'
  end


  factory :status, class:Status do
    name 'som'
  end

 factory :level, class:Level do
    name 'som'
    score 1
  end

 factory :inscrition, class:Inscrition do
    person_id 1
    vacant_id 1
    status_id 1
  end

 factory :essay, class:Essay do
    question "som"
    skill_id 1
    level_id 1
    reply "som"
  end

  factory :correction, class:Correction do
    validing "true"
    number 1
    person_question_id 1
  end

  factory :avaliable, class:Avaliable do
    level_id 1
    person_id 1
    skill_id 1
    vacant_id 1
  end

end