require_relative "../../datetime/time_zone"

module Cinema
  module Ticket
    module TicketType
      class Ordinary
        attr_reader :price, :name

        def initialize(cinema_time)
          @name = "一般"
          @price = get_ticket_price(cinema_time)
        end

        private
        def get_ticket_price(cinema_time)
          case cinema_time
          when Cinema::CinemaTime::TimeZone::WEEKDAY_CINEMA_DAY
            1100
          when Cinema::CinemaTime::TimeZone::CINEMA_DAY
            1100
          when Cinema::CinemaTime::TimeZone::WEEKDAY_DAYTIME
            1800
          when Cinema::CinemaTime::TimeZone::WEEKDAY_NIGHTTIME
            1300
          when Cinema::CinemaTime::TimeZone::HOLIDAY_DAYTIME
            1800
          when Cinema::CinemaTime::TimeZone::HOLIDAY_NIGHTTIME
            1300
          else
            puts "定義されていないチケット料金の時間帯が入力されました。 => #{cinema_time_zone}"
          end
        end
      end
    end
  end
end