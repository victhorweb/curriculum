require 'spec_helper'
describe University do
   
  it "should creating validates be universities" do
  	uni = FactoryGirl.create(:universities) 
    uni.should be_valid
  end

 it "should the name must not be blank" do
  	uni = FactoryGirl.build(:universities, name: '')  
   	uni.should_not be_valid
  end

 it "should the name must not be null" do
  	uni = FactoryGirl.build(:universities, name: nil)  
   	uni.should_not be_valid
 end
 
 it "should the state must be valid" do
  	state = FactoryGirl.build(:universities, state_id: 1)
  	state.should be_valid
  end

 it "should the state can not be null" do
    state = FactoryGirl.build(:universities, state_id: nil)
    state.should_not be_valid
  end

 it "should the city must be valid" do
  	city = FactoryGirl.build(:universities, city_id: 1)
  	city.should be_valid
  end
 
 it "should the city can not be null" do
    city = FactoryGirl.build(:universities, city_id: nil)
    city.should be_valid
  end

 it "should the name must not be blank" do
  	phone = FactoryGirl.build(:universities, phone: '')  
   	phone.should_not be_valid
  end

 it "should have a phone number not null " do
  	phone = FactoryGirl.build(:universities, phone: nil)  
   	phone.should_not be_valid
 end

  it "should have a phone number with a valid format "do
    	phone = FactoryGirl.build(:universities, phone: '(18)3631-2810') 
     	phone.should be_valid
  end

  it "should have a phone number with a not valid format "do
      phone = FactoryGirl.build(:universities, phone: '1836312810') 
      phone.should_not be_valid
  end

   it "should the address can not be null" do
     address = FactoryGirl.build(:universities, address: nil)
     address.should_not be_valid
   end
 
  it 'address should have up to 200 characters' do
     FactoryGirl.build(:universities, address: '').should_not be_valid
     FactoryGirl.build(:universities, address: 'X' * 201).should_not be_valid
     FactoryGirl.build(:universities, address: 'X' * 200).should be_valid
   end
 
  it "district should have up 50 characters" do
     FactoryGirl.build(:universities, district: '').should_not be_valid
     FactoryGirl.build(:universities, district: 'X' * 51).should_not be_valid
     FactoryGirl.build(:universities, district: 'X' * 50).should be_valid
  end

  it "should not have a zip_code with a valid format" do
      FactoryGirl.build(:universities, zip_code: "").should_not be_valid
      FactoryGirl.build(:universities, zip_code: "16021-305").should be_valid
      FactoryGirl.build(:universities, zip_code: "16021305").should_not be_valid
  end


end
