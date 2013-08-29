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
    description 'engenhacao da computaria'
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
    curriculum ' teste'
    sector_id 1
    image File.new(Rails.root + 'spec/fixtures/images/img.jpg')
    email "victhor@victhor.com"
  end

  factory :sectors, class:Course do
    name 'eng. comp'
    description 'very good'
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
  end
end