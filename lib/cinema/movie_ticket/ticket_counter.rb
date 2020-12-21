require_relative "./ticket"
require_relative "../datetime/cinema_time"
require_relative "./ticket_type/ticket_type_factory"

module Cinema
  module MovieTicket
    class TicketCounter
      attr_reader :history

      def initialize()
        @history = []
      end

      def visit_customer(screening_time,movie_title,visit_customer)
        time = DateTime::CinemaTime.new(screening_time).time_division
        ticket_type = TicketType::TicketTypeFactory.new().create(visit_customer,time)
        ticket = Ticket.new(movie_title,screening_time)
        ticket.issue(ticket_type)
        @history.push(ticket)
      end

      def calculate_sales
        @history.sum(&:price)
      end

      def calculate_each_movie_sales
        sum = Hash.new(0)
        @history.map do |log|
          sum[log.title.to_sym] += log.price
        end
        sum
      end

      def calculate_each_ticket_type_sales
        sum = Hash.new(0)
        @history.map do |log|
          sum[log.price_type.to_sym] += log.price
        end
        sum
      end
    end
  end
end