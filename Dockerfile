# Please execute the following command to build
# docker build -t ubuntu18.04_template this_file_path
# docker-compose build

# Please execute the following command to start it
# docker run -itd --name ubuntu18.04_template ubuntu18.04_template
# docker-compose up -d

# Please execute the following command to attach
# docker exec -it ubuntu18.04_template /bin/bash

# ベースイメージを指定
FROM ubuntu:18.04
# 制作者情報を指定
LABEL maintainer="hazuki3417 <hazuki3417@gmail.com>"

# 環境変数を設定
ENV TZ=Asia/Tokyo \
	DEBIAN_FRONTEND=noninteractive

RUN : "初期設定（最低限必要なツールをインストール）" && \
	apt-get update && \
	apt-get install -y \
		sudo \
		vim \
		lsb-release \ 
		tree \
		less \
		curl \
		xsel \
		iputils-ping \
		net-tools \
		nmap \
		lsof \
		iproute2 \
		gnupg \
		make

# sudoの設定

# bashの設定
RUN : "bashの設定を追加" && { \
	echo 'PS1="\! \$? \u@\h:\W# "'; \
	} | tee -a ~/.bashrc

# aliasの設定
COPY config/.bash_aliases /root/.bash_aliases

# viの設定
COPY config/.vimrc /root/.vimrc
