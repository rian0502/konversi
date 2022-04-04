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
        title: const Text("Konversi Satuan"),
        centerTitle: true,

      ),
      body: SafeArea(
        child: ListView(
          children:  [
            Menu(nama: "Massa", sub: "Mengkonversi Berat", image: "images/heavy.png",page: "berat",),
            Menu(nama: "Suhu", sub: "Mengkonversi Suhu", image: "images/suhu.png",page: "suhu",),
            Menu(nama: "Jarak", sub: "Mengkonversi Panjang Jarak", image: "images/ruler.png",page: "jarak",),

          ],
        ),
      ),
    );
  }
}
