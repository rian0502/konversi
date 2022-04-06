import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DiskonPage extends StatefulWidget {
  const DiskonPage({Key? key}) : super(key: key);
  @override
  State<DiskonPage> createState() => _DiskonPageState();
}

class _DiskonPageState extends State<DiskonPage> {
  double _penilaian = 0.0;
  double harga_asli = 0.0;
  final TextEditingController _ctrlHarga = TextEditingController();
  final TextEditingController _ctrlDiskon = TextEditingController();

  void _menghitung() {
     harga_asli = double.parse(_ctrlHarga.text);
    _penilaian = int.parse(_ctrlDiskon.text) / 100 * harga_asli;
    _penilaian -= harga_asli;
    _penilaian *= -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _ctrlHarga,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    hintText: "Harga",
                    contentPadding: EdgeInsets.only(left: 20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _ctrlDiskon,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: "Diskon",
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: ElevatedButton(
                  child: const Text("Hitung"),
                  onPressed: () {
                    setState(() {
                      _menghitung();
                    });
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 30, left: 20, right: 20),
              child: Center(
                child: Text(
                  "Hemat : ${harga_asli - _penilaian}",
                  maxLines: 1,
                  style: GoogleFonts.oswald(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ),
            Center(
              child: Text(
                "Harga Akhir : " + _penilaian.toString(),
                maxLines: 1,
                style: GoogleFonts.oswald(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
