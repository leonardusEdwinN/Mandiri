# News App
NewsApp adalah aplikasi yang menampilkan berita berita berdasarkan source dan category dengan data-data yang di provide  melalui API: "https://newsapi.org/v2"

## Setup Development
Version:
- iOS: 13.0 - Minimum Version
- XCode: 15.2 
- Swift: 5.0
- Architecture Design Pattern : Viper
- Moya

Langkah _run_ proyek:
1. Masuk ke direktori PokeApp melalui terminal.
2. Lakukan perintah pod install.
3. Buka file **PokeApp.xcworkspace** di dalam direktorinya dan Build (command + B).
4. Pilih target **scheme** sesuai environment yang akan digunakan.
5. Untuk _run_ proyek aplikasi, pilih perangkat yang digunakan dan Run (command + R).

## Feature
1. Category Page : Page menampilkan category pada saat sebelum memilih Source.
2. Source List Page: Page menampilkan list source berita (pada api tidak menyediakan page, limit, dan search) sehingga untuk page ini tidak di buat pagination.
3. News List Page: Page menampilkan article - article berdasarkan category & source yang di pilih. Pada halaman ini sudah menerapkan endless scrolling, user dapat melakukan search article pada kolom yang sudah disediakan.
4. Detail News Page : Page menampilkan webview yang akan di load berdasarkan berita yang di pilih pada halaman news list page.
