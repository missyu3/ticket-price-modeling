require_relative "./ticket_price_divide"             

module Cinema
  module MovieTicket
    module TicketType
      class HandicappedHighSchool
        include TicketPriceDivide
        attr_reader :price, :name

        def initialize(cinema_time)
          set_price()
          @name = "障がい者（高校以下）"
          @price = get_ticket_price(cinema_time)
        end

        private
        def set_price
          @weekday_daytime = 900
          @weekday_nighttime = 900
            
          @holiday_daytime = 900
          @holiday_nighttime = 900
  
          @cinema_day = 900
          @weekday_cinema_day = 900
        end
      end
    end
  end
end