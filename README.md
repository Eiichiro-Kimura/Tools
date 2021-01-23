# 習作Tools

## リポジトリの概要

* 言語の学習も兼ねて、自分が必要としているToolの格納用リポジトリ。
* あくまで習作なので、エラー処理は結構適当。

## ツールの概要

### dazn_schedule

![demo](https://user-images.githubusercontent.com/77208334/105568766-41bbf980-5d7f-11eb-8c7b-15c9b17b36ab.gif)

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
* Provider + MVVM：ソフトウェア アーキテクチャパターン
* DI：Provider + リポジトリのコンストラクタ インジェクション
* Flutter Widget Animaion：アイコンアニメーション

### RedmineSupporter

* Pythonの習作。
* コマンドラインからRedmineの作業時間入力、期日変更、子チケットの取得がしたくて作成。
