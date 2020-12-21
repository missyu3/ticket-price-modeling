require_relative "./ticket_price_divide"             

module Cinema
  module MovieTicket
    module TicketType
      class CollegeStudent
        include TicketPriceDivide
        attr_reader :price, :name

        def initialize(cinema_time)
          set_price()
          @name = "学生（大・専）"
          @price = get_ticket_price(cinema_time)
        end

        private
        def set_price
          @weekday_daytime = 1500
          @weekday_nighttime = 1300
          
          @holiday_daytime = 1500
          @holiday_nighttime = 1300

          @cinema_day = 1100
          @weekday_cinema_day = 1100
        end
      end
    end
  end
end