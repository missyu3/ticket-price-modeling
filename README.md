# ticket-price-modeling

- 元ネタ
  - https://github.com/j5ik2o/ticket-price-modeling
- お題
  - https://cinemacity.co.jp/ticket/

## Class 図

![class-uml](https://github.com/missyu3/ticket-price-modeling/blob/images/class.png)

## 実行手順

### Docker の中にはいる手順

1. `docker build .`
1. `docker images`
1. `docker run -itd IMAGE`

### Docker 内部での手順

1. `require './lib/cinema/cinema.rb'`
1. `cinema = Cinema::Cinema.new`
1. `cinema.calculate_sales_csv`

- テスト用のメソッド
  - `cinema.test_calculate_sales_csv`
