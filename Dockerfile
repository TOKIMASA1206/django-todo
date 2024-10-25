# Dockerfile

# ベースとなるPython 3.11の公式イメージを指定
FROM python:3.12

# 環境変数を設定してPythonの出力をバッファリングしないようにする
ENV PYTHONUNBUFFERED 1

# アプリケーション用のディレクトリを作成
RUN mkdir /code

# 作業ディレクトリを /code に設定
WORKDIR /code

# 依存関係ファイルをコンテナ内にコピー
COPY requirements.txt /code/

# pipをアップグレードし、依存関係をインストール
RUN pip install --upgrade pip && pip install -r requirements.txt

# アプリケーションのコードをコンテナ内にコピー
COPY . /code/
