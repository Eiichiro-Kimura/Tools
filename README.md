# 習作Tools

## リポジトリの概要

* 言語の学習も兼ねて、自分が必要としているToolの格納用リポジトリ。
* あくまで習作なので、エラー処理は結構適当。

## ツールの概要

### dazn_schedule

![dazn_schedule_image1](https://user-images.githubusercontent.com/77208334/104845933-49147a80-591b-11eb-9ed2-73c034a2c319.png)
![dazn_schedule_image2](https://user-images.githubusercontent.com/77208334/104845935-4a45a780-591b-11eb-9865-d0a15530a14e.png)
![dazn_schedule_image3](https://user-images.githubusercontent.com/77208334/104845937-4ade3e00-591b-11eb-98df-50068d98e7e9.png)

#### 制作背景
* Flutterスマホアプリの習作。
* DAZNの番組検索、Googleカレンダーへの登録がしたくて作成。
* iPhone12mini / Androidエミュレータで動作確認済み。

#### 主な機能
* DAZN番組表機能
* 番組表フィルタリング機能
* リーグ順位表機能（サッカーのみ）
* Googleカレンダー登録機能（GoogleAPIのクライアントキーが必要）

#### 使用している技術的要素
* Webスクレイピング：番組表機能
* WebAPI：リーグ順位表機能
* Provider + MVVM：ソフトウェアアーキテクチャパターン

### RedmineSupporter

* Pythonの習作。
* コマンドラインからRedmineの作業時間入力、期日変更、子チケットの取得がしたくて作成。
