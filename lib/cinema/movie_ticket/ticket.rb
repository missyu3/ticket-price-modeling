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

      def issue(ticket_type)
        @price = ticket_type.price
        @price_type = ticket_type.name
      end

    end
  end
end