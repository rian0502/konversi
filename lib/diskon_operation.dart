import 'package:flutter/material.dart';

class DiskonPage extends StatefulWidget {
  const DiskonPage({Key? key}) : super(key: key);
  @override
  State<DiskonPage> createState() => _DiskonPageState();
}

class _DiskonPageState extends State<DiskonPage> {
  double _penilaian = 0.0;
  final TextEditingController _ctrlHarga = TextEditingController();
  final TextEditingController _ctrlDiskon = TextEditingController();

  void _menghitung(){
      double harga_asli = double.parse(_ctrlHarga.text);
      _penilaian = int.parse(_ctrlDiskon.text)/100 * harga_asli;
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
                decoration: const InputDecoration(
                    hintText: "Harga",
                    contentPadding: EdgeInsets.only(left: 20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _ctrlDiskon,
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
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Text("Harga Akhir : "+_penilaian.toString(),style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
