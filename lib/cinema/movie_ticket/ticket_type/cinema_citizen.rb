require_relative "./ticket_price_divide"             

module Cinema
  module MovieTicket
    module TicketType
      class CinemaCitizen
        include TicketPriceDivide
        attr_reader :price, :name

        def initialize(cinema_time)
          set_price()
          @name = "シネマシティズン"
          @price = get_ticket_price(cinema_time)
        end

        private
        def set_price
          @weekday_daytime = 1000
          @weekday_nighttime = 1000
          
          @holiday_daytime = 1300
          @holiday_nighttime = 1000

          @cinema_day = 1100
          @weekday_cinema_day = 1000
        end
      end
    end
  end
end