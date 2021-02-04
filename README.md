# 習作Tools

## リポジトリの概要

* 言語の学習も兼ねて、自分が必要としているToolの格納用リポジトリ。

## ツールの概要

### dazn_schedule

![demo](https://user-images.githubusercontent.com/77208334/106363629-fa300180-636c-11eb-929b-006f6bb0033a.gif)

#### 制作背景
* Flutterスマホアプリの習作。
* DAZNの番組検索、Googleカレンダーへの登録がしたくて作成。
* iPhone12mini / Androidエミュレータで動作確認済み。

#### 主な機能
* DAZN番組表機能
* リーグ順位表機能（サッカーのみ）
* 得点順位表機能（サッカーのみ）
* お気に入り登録機能
* 番組表フィルタリング機能（フリーワード、日付、お気に入り）
* Googleカレンダー登録機能（GoogleAPIのクライアントキーが必要）

#### 使用している技術的要素
* Webスクレイピング：番組表機能
* WebAPI：リーグ順位表機能
* Provider + MVVM：ソフトウェア アーキテクチャパターン
* DI：Provider + リポジトリのコンストラクタ インジェクション
* Flutter Widget Animaion：アイコンアニメーション
* Database：hive

### RedmineSupporter

* Pythonの習作。
* コマンドラインからRedmineの作業時間入力、期日変更、子チケットの取得がしたくて作成。
