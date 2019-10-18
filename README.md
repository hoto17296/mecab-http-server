# MeCab API

## Setup
``` console
$ docker build -t mecab-api .
```

## Run Server
```
$ docker run --rm -d -p 80:8080 mecab-api
```

## Request Example
``` console
$ curl http://localhost/ -XPOST -d 'メロスは激怒した。'
メロス  名詞,一般,*,*,*,*,*
は      助詞,係助詞,*,*,*,*,は,ハ,ワ
激怒    名詞,サ変接続,*,*,*,*,激怒,ゲキド,ゲキド
し      動詞,自立,*,*,サ変・スル,連用形,する,シ,シ
た      助動詞,*,*,*,特殊・タ,基本形,た,タ,タ
。      記号,句点,*,*,*,*,。,。,。
EOS
```
