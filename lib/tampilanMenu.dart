import 'package:flutter/material.dart';
import 'package:muhammadfebrianhasibuan/beratOperation.dart';
import 'package:muhammadfebrianhasibuan/bmi_operation.dart';
import 'package:muhammadfebrianhasibuan/diskon_operation.dart';
import 'package:muhammadfebrianhasibuan/suhuOperation.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatelessWidget {
  Menu({Key? key,  required  this.nama, required this.sub, required this.image, required this.page}) : super(key: key);
  String nama;
  String sub;
  String image;
  String page;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () => {
            if(page == "berat"){
              Navigator.push(context,MaterialPageRoute(builder: (context) => const BeratPage()))
            }else if(page == "suhu"){
              Navigator.push(context,MaterialPageRoute(builder: (context) => const SuhuKonversi()))
            }else if(page == "panjang"){
              Navigator.push(context,MaterialPageRoute(builder: (context) => const BeratPage()))
            }else if(page == "diskon"){
              Navigator.push(context,MaterialPageRoute(builder: (context) => const DiskonPage()))
            }else{
              Navigator.push(context,MaterialPageRoute(builder: (context) => const BmiPage()))
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  image,
                  width: 80,
                  height: 80,

                ),
              ),
              ListTile(
                title: Text(nama, style: GoogleFonts.domine(fontWeight: FontWeight.bold, fontSize: 20) ,),
                subtitle: Text(sub,style: GoogleFonts.heebo(),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
