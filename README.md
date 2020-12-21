# ticket-price-modeling

- 元ネタ
  - https://github.com/j5ik2o/ticket-price-modeling
- お題
  - https://cinemacity.co.jp/ticket/

## 実行手順

### Docker の中にはいる手順

1. `docker build .`
1. `docker images`
1. `docker run -itd IMAGE`
1. `docker ps`
1. `docker exec -it CONTAINER ID bash`

### Docker 内部での手順

1. `cd app`
1. `require './lib/cinema/cinema.rb'`
1. `cinema = Cinema::Cinema.new`
1. `cinema.calculate_sales_csv`
1. `cinema.test_calculate_sales_csv`[^テスト]

[^テスト]: 出力データと同じデータを出力したい場合はこのメソッドを呼び出す。
