require "csv"
require 'time'
require 'action_view'
require_relative "movie_ticket/ticket_counter"
include ActionView::Helpers::NumberHelper

module Cinema
  class Cinema

    def test
      logs = read_csv_visiter_log
      counter = register_ticket_counter(logs)
      counter.history.each do |a|
        puts "#{a.title} : #{a.screening_time} : #{a.price_type} : #{a.price}"
        puts
      end

    end

    def calculate_sales_csv
      logs = read_csv_visiter_log
      counter = register_ticket_counter(logs)
      output_sales(counter)
      output_each_movie_sales(counter)
      output_each_ticket_type_sales(counter)
    end

    def test_calculate_sales_csv
      logs = read_csv_visiter_log
      counter = register_ticket_counter(logs)
      output_sales(counter)
      test_each_movie_sales(counter)
      test_each_ticket_type_sales(counter)
    end

    private
    def read_csv_visiter_log
      CSV.read("visiter_log.csv")
    end

    def register_ticket_counter(logs)
      ticket_counter = MovieTicket::TicketCounter.new()
      logs.each do |log|
        cinema_time = Time.parse(log[0])
        movie_title = log[1]
        visit_customer = log[2]
        ticket_counter.visit_customer(cinema_time,movie_title,visit_customer)
      end
      ticket_counter
    end

    def output_sales(ticket_counter)
      sum = number_to_jpy(ticket_counter.calculate_sales)
      puts "▼サマリー"
      puts "売上: #{sum}円"
      puts
    end

    def output_each_movie_sales(ticket_counter)
      movies = ticket_counter.calculate_each_movie_sales
      puts "▼作品別売上"
      movies.each do |movie|
        puts "#{movie[0].to_s}: #{number_to_jpy(movie[1])}円"
      end
      puts
    end

    def output_each_ticket_type_sales(ticket_counter)
      price_types = ticket_counter.calculate_each_ticket_type_sales
      puts "▼料金タイプ別売上"
      price_types.each do |price_type|
        puts "#{price_type[0].to_s}: #{number_to_jpy(price_type[1])}円"
      end
    end

    def number_to_jpy(numeric)
      number_to_currency(numeric, unit: '', precision: 0)
    end

    def test_each_movie_sales(ticket_counter)
      movies = ticket_counter.calculate_each_movie_sales
      puts "▼作品別売上"
      test_puts(movies,"スター・ウォーズ")
      test_puts(movies,"ジュマンジ")
      test_puts(movies,"ジョーカー")
      test_puts(movies,"ルパン三世")
      test_puts(movies,"アナと雪の女王")
      puts
    end

    def test_each_ticket_type_sales(ticket_counter)
      movies = ticket_counter.calculate_each_ticket_type_sales
      puts "▼料金タイプ別売上"
      test_puts(movies,"シネマシティズン（60才以上）")
      test_puts(movies,"幼児（3才以上）・小学生")
      test_puts(movies,"シニア（70才以上）")
      test_puts(movies,"シネマシティズン")
      test_puts(movies,"学生（大・専）")
      test_puts(movies,"中・高校生")
      test_puts(movies,"一般")
      test_puts(movies,"障がい者（学生以上）")
      test_puts(movies,"障がい者（高校以下）")
    end

    def test_puts(array,key)
      puts "#{key}: #{number_to_jpy(array[key.to_sym])}円"
    end
  end
end