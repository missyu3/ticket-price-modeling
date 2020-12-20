module Cinema
  module Customer
    class User
      attr_reader :have_id_cord,
                  :have_student_id_cord
                  :have_student_notebook
                  :have_disability_notebook

      def initialize(user_infomation)
        #身分証
        @have_id_cord = false
        #学生証
        @have_student_id_cord = false
        #生徒手帳
        @have_student_notebook = false
        #障害者手帳
        @have_disability_notebook = false
      end

      def Decompress(user_infomation)
        case user_infomation
        when "シネマシティズン"
        when "シネマシティズン（60才以上）"
        when "一般"
        when "シニア（70才以上）"
        when "学生（大・専）"
        when "中・高校生"
        when "幼児（3才以上）・小学生"
        when "障がい者（学生以上）"
        when "障がい者（高校以下）"
        else 
          puts "定義されていないユーザーが入力されました。 => #{user_infomation}"
      end
    end
  end
end