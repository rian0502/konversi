import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BeratPage extends StatefulWidget {
  const BeratPage({Key? key}) : super(key: key);

  @override
  State<BeratPage> createState() => _BeratPageState();
}

class _BeratPageState extends State<BeratPage> {
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
                items: <String>['Ton', 'Kg', 'g', 'Mg'].map((String value) {
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
                items: <String>['Ton', 'Kg', 'g', 'Mg'].map((String value) {
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
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_menuPertama == "Pilih Satuan" ||
                      _menukedua == "Pilih Satuan") {
                    Fluttertoast.showToast(msg: "Pilih Satuan Terlebih dahulu !",timeInSecForIosWeb: 1);
                  } else {
                    if (_menuPertama == 'Ton') {
                      if (_menukedua == 'Kg') {
                        _hasilconversi = double.parse(_ctrlBerat.text) * 1000;
                      } else if (_menukedua == 'g') {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text) * 1000000;
                      } else if (_menukedua == "Mg") {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text) * 1000000000;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_menuPertama == 'Kg') {
                      if (_menukedua == 'Ton') {
                        _hasilconversi = double.parse(_ctrlBerat.text) / 1000;
                      } else if (_menukedua == 'g') {
                        _hasilconversi = double.parse(_ctrlBerat.text) * 1000;
                      } else if (_menukedua == "Mg") {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text) * 1000000;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else if (_menuPertama == "g") {
                      if (_menukedua == 'Ton') {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text) / 1000000;
                      } else if (_menukedua == 'Kg') {
                        _hasilconversi = double.parse(_ctrlBerat.text) / 1000;
                      } else if (_menukedua == "Mg") {
                        _hasilconversi = double.parse(_ctrlBerat.text) * 1000;
                      } else {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text.toString());
                      }
                    } else {
                      if (_menukedua == 'Ton') {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text) / 1000000000;
                      } else if (_menukedua == 'Kg') {
                        _hasilconversi =
                            double.parse(_ctrlBerat.text) / 1000000;
                      } else if (_menukedua == "g") {
                        _hasilconversi = double.parse(_ctrlBerat.text) / 1000;
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
            padding: const EdgeInsets.all(30),
            child: Text(_hasilconversi.toString()),
          )
        ]),
      ),
    );
  }
}
