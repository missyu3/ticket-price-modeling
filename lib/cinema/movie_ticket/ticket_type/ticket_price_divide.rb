require_relative "../../datetime/time_zone"

module Cinema
  module MovieTicket
    module TicketType
      module TicketPriceDivide
        private
        def get_ticket_price(cinema_time)
          case cinema_time
          when ::Cinema::DateTime::TimeZone::WEEKDAY_CINEMA_DAY
            @weekday_cinema_day
          when ::Cinema::DateTime::TimeZone::CINEMA_DAY
            @cinema_day
          when ::Cinema::DateTime::TimeZone::WEEKDAY_DAYTIME
            @weekday_daytime
          when ::Cinema::DateTime::TimeZone::WEEKDAY_NIGHTTIME
            @weekday_nighttime
          when ::Cinema::DateTime::TimeZone::HOLIDAY_DAYTIME
            @holiday_daytime
          when ::Cinema::DateTime::TimeZone::HOLIDAY_NIGHTTIME
            @holiday_nighttime
          else
            puts "定義されていないチケット料金の時間帯が入力されました。 => #{cinema_time}"
          end
        end
      end
    end
  end
end