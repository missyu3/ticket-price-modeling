require_relative "./cinema_citizen.rb"             
require_relative "./college_student.rb"            
require_relative "./handicapped.rb"                  
require_relative "./high_school_student.rb"          
require_relative "./senior.rb"
require_relative "./cinema_citizen_senior.rb"       
require_relative "./elementary_school_student.rb" 
require_relative "./handicapped_high_school.rb"   
require_relative "./ordinary.rb"

module Cinema
  module MovieTicket
    module TicketType
      class TicketTypeFactory
        def create(user_infomation,cinema_time)
          case user_infomation
          when "シネマシティズン"
            CinemaCitizen.new(cinema_time)
          when "シネマシティズン（60才以上）"
            CinemaCitizenSenior.new(cinema_time)
          when "一般"
            Ordinary.new(cinema_time)
          when "シニア（70才以上）"
            Senior.new(cinema_time)
          when "学生（大・専）"
            CollegeStudent.new(cinema_time)
          when "中・高校生"
            HighSchoolStudent.new(cinema_time)
          when "幼児（3才以上）・小学生"
            ElementarySchoolStudent.new(cinema_time)
          when "障がい者（学生以上）"
            Handicapped.new(cinema_time)
          when "障がい者（高校以下）"
            HandicappedHighSchool.new(cinema_time)
          else 
            puts "定義されていないユーザーが入力されました。 => #{user_infomation}"
          end
        end
      end
    end
  end
end