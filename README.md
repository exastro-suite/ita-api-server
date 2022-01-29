# Exastro IT Automation APIサーバ

Exastro IT AutomationのAPIサーバです。


# 開発用コンテナの利用方法

## ビルド

ビルド時にはネットワーク越しに必要なファルをダウンロードします。
そのため、プロキシサーバの設定が必要な場合は、以下の環境変数を事前に設定しておきます。

```
$ export http_proxy=http://your-proxy-server:port/
$ export https_proxy=http://your-proxy-server:port/
$ export no_proxy=http://your-proxy-server:port/
```

また、httpsの通信にあたって追加のルート証明書が必要な場合は、以下の環境変数を事前に設定しておきます。

```
$ export EXASTRO_EXTRA_ROOT_CA=/path/to/exstra-root-ca.crt
```

必要に応じて上記の設定を行った後、以下のコマンドを実行して開発用コンテナをビルドします。

```
$ make build
```

## 起動

開発用コンテナを起動するには、以下のコマンドを実行します。

```
$ make run
```

起動が成功すると、`http://localhost:8080/`にアクセスすることでAPIを呼び出すことができます。


## 停止

開発用コンテナを停止するには、以下のコマンドを実行します。

```
$ make stop
```


## 再開

停止している開発用コンテナを再開するには、以下のコマンドを実行します。

```
$ make start
```


## 再起動

開発用コンテナを再起動するには、以下のコマンドを実行します。

```
$ make restart
```


## 破棄

開発用コンテナを破棄するには、以下のコマンドを実行します。

```
$ make rm
```


# ソースコードの修正方法

開発用コンテナでは、コンテナ内のパス`/exastro-packages/exastro`にホスト側のパス`./exastro`をマウントするため、ホスト側で修正したファイルはコンテナ内からも読み取ることができます。
ただし、APIサーバに修正したソースコードの内容を反映させるためには、大抵の場合はコンテナの再起動が必要になります。
