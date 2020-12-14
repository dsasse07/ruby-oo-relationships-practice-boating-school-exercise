class Instructor
    @@all = []

    def initialize(name)
        @@all << self
        @name = name
    end

    def self.all
        @@all
    end

    def tests
        BoatingTest.all.select {|test| test.instructor == self}
    end

    def passed_tests
        self.tests.select {|test| test.status == "passed"}
    end

    def passed_students
        self.passed_tests.map(&:student).uniq
    end

    def pass_student(student_obj, test_to_grade)
        graded_test = find_by_student_and_test_name(student_obj, test_to_grade)
        graded_test.status = "passed"
    end

    def fail_student(student_obj, name_of_test)
        test_to_grade = find_by_student_and_test_name(student_obj, name_of_test)
        test_to_grade ||= BoatingTest.new(student_obj, test_to_grade, self, "failed")
        test_to_grade.status = "failed"
    end

    private

    def find_by_student_and_test_name (student_obj, name_of_test)
        self.tests.find{|test| test.student == student_obj && test.test_name == name_of_test}
    end

    
end
