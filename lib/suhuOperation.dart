import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SuhuKonversi extends StatefulWidget {
  const SuhuKonversi({Key? key}) : super(key: key);

  @override
  State<SuhuKonversi> createState() => _SuhuKonversiState();
}

class _SuhuKonversiState extends State<SuhuKonversi> {
  String _menuPertama = "Pilih Satuan";
  String _menukedua = "Pilih Satuan";
  double _hasilconversi = 0.0;
  final TextEditingController _ctrlBerat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<String>(
                hint: Text(_menuPertama),
                items: <String>['C', 'F', 'K', 'R'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _menuPertama = value.toString();
                  });
                },
              ),
              const Text("To"),
              DropdownButton<String>(
                hint: Text(_menukedua),
                items: <String>['C', 'F', 'K', 'R'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _menukedua = value.toString();
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextFormField(
              controller: _ctrlBerat,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: _menuPertama,
                  labelText: _menuPertama),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_menuPertama == "Pilih Satuan" ||
                      _menukedua == "Pilih Satuan") {
                    Fluttertoast.showToast(
                        msg: "Pilih Satuan Terlebih dahulu !",
                        timeInSecForIosWeb: 1);
                  } else {
                    if (_menuPertama == 'C') {
                      if (_menukedua == 'F') {
                        _hasilconversi =
                            (9 / 5 * double.parse(_ctrlBerat.text)) + 32;
                      } else if (_menukedua == 'R') {
                        _hasilconversi = 4 / 5 * double.parse(_ctrlBerat.text);
                      } else if (_menukedua == "K") {
                        _hasilconversi = double.parse(_ctrlBerat.text) + 273;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_menuPertama == 'F') {
                      if (_menukedua == 'C') {
                        _hasilconversi =
                            5 / 9 * (double.parse(_ctrlBerat.text) - 32);
                      } else if (_menukedua == 'K') {
                        _hasilconversi =
                            (double.parse(_ctrlBerat.text) + 459.67) * 5 / 9;
                      } else if (_menukedua == "R") {
                        _hasilconversi =
                            (double.parse(_ctrlBerat.text) - 32) * 4 / 9;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_menuPertama == "K") {
                      if (_menukedua == 'C') {
                        _hasilconversi = double.parse(_ctrlBerat.text) - 273.15;
                      } else if (_menukedua == 'F') {
                        _hasilconversi =
                            (double.parse(_ctrlBerat.text) - 273.15) * 9 / 5 +
                                32;
                      } else if (_menukedua == "R") {
                        _hasilconversi =
                            (double.parse(_ctrlBerat.text) - 273.15) * 4 / 5;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else {
                      if (_menukedua == 'C') {
                        _hasilconversi = double.parse(_ctrlBerat.text) * 5 / 4;
                      } else if (_menukedua == 'F') {
                        _hasilconversi =
                            (double.parse(_ctrlBerat.text) * 9 / 4) + 32;
                      } else if (_menukedua == "K") {
                        _hasilconversi =
                            (double.parse(_ctrlBerat.text) / 0.8) + 273.15;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    }
                  }
                });
              },
              child: const Text("Convert"),
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
              _hasilconversi.toStringAsFixed(2),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
