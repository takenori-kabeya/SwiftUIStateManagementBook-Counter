# カウンタアプリ：書籍のサンプルコード

本リポジトリは、『SwiftUIの状態管理：アプリ開発で学ぶTCA』で使用するカウンタアプリのサンプルコードです。

小さなアプリを使って、The Composable Architecture（TCA）の基本構造や、親子Featureの組み合わせを確認します。

## このサンプルで扱うこと

- State、Action、Reducer、Storeの役割とつながり
- ViewからActionを送り、状態の変更を画面に反映する流れ
- 親子FeatureのStateとActionを組み合わせる方法
- 親子Featureと、それぞれのViewをつなぐ方法

本編の旅行計画アプリにTCAを導入する際に、仕組みを小さなコードで確かめるためのサンプルです。本文の説明とあわせて参照してください。

## サンプルコード一覧

本書のサンプルコードは、用途ごとに次の3つのリポジトリに分かれています。

| サンプル | リポジトリ | 用途 |
| --- | --- | --- |
| 旅行計画アプリ Shiori | [SwiftUIStateManagementBook-Shiori](https://github.com/takenori-kabeya/SwiftUIStateManagementBook-Shiori) | 本編で開発するアプリです。状態の所有、編集とキャンセル、外部処理、非同期処理の制御、画面遷移などを、アプリへの導入を通して扱います。 |
| カウンタアプリ | [SwiftUIStateManagementBook-Counter](https://github.com/takenori-kabeya/SwiftUIStateManagementBook-Counter) | 本リポジトリです。TCAの基本構造や親子Featureの組み合わせを確認するためのサンプルです。 |
| 天気予報の試作アプリ | [SwiftUIStateManagementBook-WeatherPrototype](https://github.com/takenori-kabeya/SwiftUIStateManagementBook-WeatherPrototype) | 天気予報APIの呼び出しと、取得した情報の表示を確認するための試作アプリです。 |

## 本文とコードの対応

本文では、確認したい仕組みに合わせて、カウンタアプリの構成や実装を変更します。本文中のコードを確認するときは、本文に記載されたリンクまたはタグ名から、その時点のコードを参照してください。

カウンタアプリで確認した仕組みを、旅行計画アプリでどのように使うかは、本文とShioriのサンプルコードで確認できます。

## TCAのバージョン

本書のTCAの説明とサンプルコードは、TCA 1.26.1を基準にしています。
