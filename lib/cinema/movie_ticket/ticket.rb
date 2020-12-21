module Cinema
  module MovieTicket
    class Ticket
      attr_reader :title,
                  :screening_time,
                  :price,
                  :price_type

      def initialize(title,screening_time)
        @title = title
        @screening_time = screening_time
        @price = nil
        @price_type = nil
      end

      def issue(visit_customer,cinema_time,is_3d_movie,have_3d_glasses)
        ticket_type = TicketType::TicketTypeFactory.new().create(visit_customer,cinema_time)
        @price = ticket_type.price
        @price_type = ticket_type.name
        @price += get_3d_movie_price(have_3d_glasses) if is_3d_movie
      end

      private 
      def get_3d_movie_price(have_3d_glasses)
        have_3d_glasses ? 300:400
      end

    end
  end
end