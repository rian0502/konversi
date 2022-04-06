import 'package:flutter/material.dart';
import 'package:muhammadfebrianhasibuan/tampilanMenu.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Konversi"),
        centerTitle: true,

      ),
      body: SafeArea(
        child: ListView(
          children:  [
            Menu(nama: "Jarak", sub: "Mengkonversi Panjang Jarak", image: "images/ruler.png",page: "panjang",),
            Menu(nama: "Massa", sub: "Mengkonversi Berat", image: "images/heavy.png",page: "berat",),
            Menu(nama: "Suhu", sub: "Mengkonversi Suhu", image: "images/suhu.png",page: "suhu",),
            Menu(nama: "Body Massa Index", sub: "Menghitung Standar Berat Badan", image: "images/bmi.png", page: "bmi"),
            Menu(nama: "Diskon", sub: "Menghitung Diskon Dari harga", image: "images/discounts.png", page: "diskon"),
          ],
        ),
      ),
    );
  }
}
