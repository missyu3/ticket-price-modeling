require "date"
require "holiday_jp"
require_relative "./time_zone"


module Cinema
  module DateTime
    class CinemaTime
      attr_reader :time_division

      def initialize(now)
        @time_division = nilget_time_division(now)
      end

      private
      def get_time_division(now)
        if is_cinema_day?(now)
          Cinema::CinemaTime::TimeZone::CINEMA_DAY
        elsif is_weekday?(now) && is_daytime?(now)
          Cinema::CinemaTime::TimeZone::WEEKDAY_DAYTIME
        elsif is_weekday?(now) && is_nighttime?(now)
          Cinema::CinemaTime::TimeZone::WEEKDAY_NIGHTTIME
        elsif is_holiday?(now) && is_nighttime?(now)
          Cinema::CinemaTime::TimeZone::HOLIDAY_DAYTIME
        elsif is_holiday?(now) && is_nighttime?(now)
          Cinema::CinemaTime::TimeZone::HOLIDAY_NIGHTTIME
        else
          puts "定義されていない時間が入力されました。#{now}"
        end
      end

      def is_cinema_day?(now)
        now.day == 1
      end

      def is_weekday?(now)
        HolidayJp.holiday?(now).nil && (1..5).include?(now.wday)
      end

      def is_holiday?(now)
        # Date#wdayは日曜日は0、土曜日は6で返却される。
        HolidayJp.holiday?(now) || [0,6].include?(now.wday)
      end

      def is_daytime?(now)
        now.hour > 20
      end

      def is_nighttime?(now)
        now.hour <= 20
      end
    end
  end
end

