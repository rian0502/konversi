import 'package:flutter/material.dart';
import 'package:muhammadfebrianhasibuan/beratOperation.dart';
import 'package:muhammadfebrianhasibuan/suhuOperation.dart';


class Menu extends StatelessWidget {
  Menu({ required  this.nama, required this.sub, required this.image, required this.page});
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
              Navigator.push(context,MaterialPageRoute(builder: (context) => BeratPage()))
            }else if(page == "suhu"){
              Navigator.push(context,MaterialPageRoute(builder: (context) => SuhuKonversi()))
            }else if(page == "panjang"){
              Navigator.push(context,MaterialPageRoute(builder: (context) => BeratPage()))
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
                title: Text(nama),
                subtitle: Text(sub),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
