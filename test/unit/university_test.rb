require 'test_helper'

class UniversityTest < ActiveSupport::TestCase
	setup do
		@university = universities(:admin)
	end

	

	test "the name of the school college andnot be null" do
		assert @university.valid?
	end

	test "the name of the school college andnot be ' ' " do
		@university.name = nil
		assert !@university.valid?
	end

end
