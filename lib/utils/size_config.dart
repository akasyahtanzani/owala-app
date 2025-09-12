import 'package:flutter/material.dart';

class SizeConfig {
  // class MediaQuery adalah class yang berfungsi untuk membuat aplikais menjadi responsif
  // dengan cara mengambil ukuran aktual pada layar platfrom
  static  MediaQueryData _mediaQueryData = 
  MediaQueryData.fromView(
// ignore: deprecated_member_use
WidgetsBinding.instance.window
  );

//variabel untuk menampung dafault size dari aplikasi
// sebelum dideploy ke platform yang spesifik
// dan mendapatkan ukuran aktual dari platform tersebut
// (misal : dideploy ke andorid)  static double 
  static double screenWidht = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;

//ini adalah untuk pemanggilan awal ketika aplikasi di jalankan
//dan untuk mendapatkan ukuran dari layar platfrom
  void init(BuildContext context) {
    //berfungsi untuk mengambil ukuran aktual dari platfrom
    //karna di dalam variabel  _mediaQueryData...
    //didalamnya memanggil class Media Query
    //yang class mediaquery itu sendiri berfungsi untuk ,
    //mengambil ukuran aktual dari platfrom
    _mediaQueryData = MediaQuery.of(context);
    //untuk mengambil hanya data ukuran width saja
    screenWidht = _mediaQueryData.size.width;
        //untuk mengambil hanya data ukuran height saja
    screenWidht = _mediaQueryData.size.height;
  }
}

// menggunakan size standar dari hp iphone x (812 x 375)
double getProporsionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // ini adalah perhitungan untuk menghasilkan nilai dan ukuran objek yang responsif sesuai dengan platfrom
  return (inputHeight / 812.0) * screenHeight;
  
}
double getProporsionateScreenWiDht(double inputWidht) {
  double screenWidht = SizeConfig.screenWidht;
  return (inputWidht / 375.0) * screenWidht;
  
}