require "date"
require "holiday_jp"
require_relative "./time_zone"


module Cinema
  module DateTime
    class CinemaTime
      attr_reader :time_division

      def initialize(now)
        @time_division = get_time_division(now)
      end

      private
      def get_time_division(now)
        cinemaday = is_cinema_day?(now)
        weekday = is_weekday?(now)
        holiday = is_holiday?(now)
        daytime = is_daytime?(now)
        nighttime = is_nighttime?(now)

        if cinemaday && weekday
          TimeZone::WEEKDAY_CINEMA_DAY
        elsif cinemaday 
          TimeZone::CINEMA_DAY
        elsif weekday && daytime
          TimeZone::WEEKDAY_DAYTIME
        elsif weekday && nighttime
          TimeZone::WEEKDAY_NIGHTTIME
        elsif holiday && daytime
          TimeZone::HOLIDAY_DAYTIME
        elsif holiday && nighttime
          TimeZone::HOLIDAY_NIGHTTIME
        else
          puts "定義されていない時間が入力されました。 => #{now}"
        end
      end

      def is_cinema_day?(now)
        now.day == 1
      end

      def is_weekday?(now)
        !(HolidayJp.holiday?(now)) && (1..5).include?(now.wday)
      end

      def is_holiday?(now)
        # Date#wdayは日曜日は0、土曜日は6で返却される。
        HolidayJp.holiday?(now) || [0,6].include?(now.wday)
      end

      def is_daytime?(now)
        now.hour < 20
      end

      def is_nighttime?(now)
        now.hour >= 20
      end
    end
  end
end

