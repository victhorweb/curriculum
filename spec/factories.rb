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
		name 'anderson'
		phone '(18)3631-2810'
		mobile_phone '(18)9604-1211'
		university_id 1
		course_id 1 
		semester 1 
		state_id 1
		city_id 1
		work true
		video_conf 'victhor@victhor.com'
		curriculum 'name.doc'
		sector_id 1
		image "img.jpg"
		email "victhor@victhor.com"
		#born_at 1991-09-09
	end

	factory :sectors, class:Course do
 		name 'eng. comp'
		description 'very good'
	end

	factory :vacant, class:Vacant do
		title 'vacants'
		description 'description vacants'
		date_end 2013-12-12
		sector_id 1
	end

	factory :skill, class:Skill do
		name 'ruby'
		description 'ruby language'
		sector_id 1 
	end
end