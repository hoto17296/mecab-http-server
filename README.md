# MeCab HTTP Server

## Setup
``` console
$ docker build -t mecab-http-server .
```

## Run Server
```
$ docker run --rm -d -p 8080:8080 mecab-http-server
```

## Request Example
``` console
$ curl http://localhost:8080/ -XPOST -d 'メロスは激怒した。'
メロス  名詞,一般,*,*,*,*,*
は      助詞,係助詞,*,*,*,*,は,ハ,ワ
激怒    名詞,サ変接続,*,*,*,*,激怒,ゲキド,ゲキド
し      動詞,自立,*,*,サ変・スル,連用形,する,シ,シ
た      助動詞,*,*,*,特殊・タ,基本形,た,タ,タ
。      記号,句点,*,*,*,*,。,。,。
EOS
```

## Python Example
``` python
import urllib.request

class MeCab:

    def __init__(self, url: str):
        self.url = url

    def __call__(self, text: str) -> str:
        req = urllib.request.Request(self.url, text.encode())
        with urllib.request.urlopen(req) as res:
            return res.read().decode()

mecab = MeCab('http://<hostname>/')
print(mecab('メロスは激怒した。'))
```
