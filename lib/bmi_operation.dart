import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController ctrlTinggi = TextEditingController();
  TextEditingController ctrlBerat = TextEditingController();
  double _bmi = 0.0;

  double _hitungBmi(){
    _bmi = double.parse(ctrlBerat.text) / (double.parse(ctrlTinggi.text)/100 * double.parse(ctrlTinggi.text)/100);
    return _bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 30, right: 30),
              child: TextFormField(
                controller: ctrlTinggi,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: "ex : 175",
                  labelText: "Tinggi",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 30, right: 30),
              child: TextFormField(
                controller: ctrlBerat,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: "ex : 80",
                  labelText: "Berat",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                child: const Text("Hitung"),
                onPressed: () {
                  setState(() {
                    _hitungBmi();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "Hasil",
                  maxLines: 1,
                  style: GoogleFonts.oswald(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Text(
                _bmi.toString(),
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
