class BoatingTest
    @@all = []
    attr_reader :test_name, :student, :instructor
    attr_accessor :status

    def initialize(student_obj, test_name_para, instructor_obj, status="pending")
        @@all << self
        @test_name = test_name_para
        @student = student_obj
        @instructor = instructor_obj
        @status = status
    end

    def self.all
        @@all
    end
end
