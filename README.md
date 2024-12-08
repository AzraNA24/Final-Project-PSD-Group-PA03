# Final Project PSD PA03 - QR Code Generator

## Background
QR Code saat ini sudah jadi bagian penting dalam berbagai aktivitas sehari-hari, seperti pembayaran digital, pelacakan barang, hingga keamanan data. Teknologi ini populer karena mampu menyimpan informasi secara praktis dan mudah diakses. Dengan berkembangnya kebutuhan akan sistem yang cepat dan efisien, FPGA atau Field-Programmable Gate Array bisa digunakan sebagai solusi yang menarik. FPGA punya keunggulan dalam hal fleksibilitas dan kemampuan memproses data secara paralel, sehingga cocok untuk aplikasi seperti pembuatan dan pembacaan QR Code dalam berbagai keperluan.

## How it works
Program akan mengambil input berupa 8 karakter yang akan diubah ke alphanumerik, lantas, menghitung Reed Solomon, menggabungkannya dengan kode dan Informasi QR sebelum melakukan Masking pattern type 1. Setelah itu, penambahan Path finder dan timing Pattern.

## How to use
Masukkan 8 karakter Huruf kapital atau angka ke dalam TestBench dari `Top_Level`. Kode akan mengenerate txt yang berisi 1 dan 0 untuk mewakilkan hitam dan putih. Kode lantas bisa digenerate ke gambar menggunakan `output.py`

## Testing
Untuk hasil percobaan selengkapnya dapat dilihat pada laporan proyek akhir

## Authors

- [@AzraNA24](https://github.com/AzraNA24)
- [@AdhiRajasaRafif02]()