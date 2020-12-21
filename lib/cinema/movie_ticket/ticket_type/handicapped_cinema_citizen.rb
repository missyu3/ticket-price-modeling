require_relative "./ticket_price_divide"             

module Cinema
  module MovieTicket
    module TicketType
      class HandicappedCinemaCitizen
        include TicketPriceDivide
        attr_reader :price, :name

        def initialize(cinema_time)
          set_price()
          @name = "障がい者（シネマシティズン）"
          @price = get_ticket_price(cinema_time)
        end

        private
        def set_price
          @weekday_daytime = 500
          @weekday_nighttime = 500
          
          @holiday_daytime = 500
          @holiday_nighttime = 500

          @cinema_day = 500
          @weekday_cinema_day = 500
        end
      end
    end
  end
end