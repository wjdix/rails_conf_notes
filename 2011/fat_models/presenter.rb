class StudentReport
  attr_reader :student, :term, :report_type
  # delegate to children
  # except when it should be pulled up into report
  # ex. course reports moved from student to report presenter
  def initialize(params)
    @student = Student.find params[:student_id]
    @term = Term
  end
  
end

# in Controller

def show
  @report = StudentReport.new(params)
end

