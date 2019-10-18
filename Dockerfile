FROM python:3.7

# Install MeCab
RUN apt-get update && \
  apt-get -q -y install mecab libmecab-dev mecab-ipadic-utf8 && \
  apt-get clean

# Install mecab-ipadic-NEologd
RUN apt-get update && \
  apt-get -q -y install git curl make file sudo && \
  apt-get clean && \
  git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
  echo yes | mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n && \
  rm -rf mecab-ipadic-neologd && \
  sed -i -e 's!/var/lib/mecab/dic/debian!/usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd!g' /etc/mecabrc

# Install Python modules
RUN apt-get update && \
  apt-get -q -y install swig && \
  pip install aiohttp==3.* mecab-python3 && \
  apt-get clean

ADD app.py /

CMD ["python", "/app.py"]
