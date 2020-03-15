# urlencode_udf
urlencode/decode udf for DB2 for i

DB2 for i のUDFとして使えるURL_ENCODE, URL_DECODE

encede/decodeの処理はLibHTTPのhttplib_url_encode, httplib_url_decodeをベースとしています。

LibHTTP https://github.com/lammertb/libhttp


コンパイル時の注意点
文字コードをutf-8として扱うため、LOCALETYPE(*LOCALEUTF)を指定します

