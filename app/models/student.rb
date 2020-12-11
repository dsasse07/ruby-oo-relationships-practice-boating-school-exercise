class Student
    @@all = []
    attr_reader :first_name

    def initialize(first_name)
        @@all << self
        @first_name = first_name
    end

    def self.all
        @@all
    end

    #BoatingTest initializes with (student, test_name, instructor, status="pending"). Will not pass status as argument since students should not be able to grade their own tests
    def add_boating_test(test_name, instructor_obj)
        BoatingTest.new(self, test_name, instructor_obj)
    end

    def tests
        BoatingTest.all.select {|test| test.student == self}
    end

    def all_instructors
        self.tests.map(&:instructor).uniq
    end

    def self.find_student(first_name)
        self.all.find {|student| student.first_name == first_name}
    end

    def grade_percentage
        passing_tests = self.tests.count {|test| test.status == "passed"}
        total_tests = self.tests.count
        passing_tests/total_tests.to_f*100
    end
end
