import 'package:flutter/material.dart';

import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';

import 'package:flutter/services.dart';

import 'package:insight3/pages/ar.pages.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String key = "GGkUz2PKRSyTZTWStVRszG2WKmHRsdzrt8rx7xvq3RxPMwczHMq9VcHwEP9rwdBbNgqj2mKMZhwRaKsqDJustjc4FeRP4JthSDTmWW7ebGajdNyPR7rLtYZuBVEQ8xTVQKeZDaGpTKUZCvH9bxBHDZtJP9qn8zYRpV7SsuP89gWt6QQNkd7hJ7dzrzfjwaWgHREcjuAMtJES4xN5DnzkTKKfB9e8X6zjHE9p3jJ59sG8BGmBRXLzDpUCXbWJ8QG7";
  String result = "Para iniciar, escaneie o código!";
  int cor = 0xffffffff;
  Future _scanQR() async {
    try{
      String qrResult = await BarcodeScanner.scan();
      if(qrResult == key){
        Navigator.popAndPushNamed(
          context, "/CH"
          );
      }else{
        setState(() {
        result= qrResult;
      });
      }
      
    }on PlatformException catch(ex){
      if(ex.code == BarcodeScanner.CameraAccessDenied){

        setState(() {
        result = "Acesso a câmera foi negado.";
        cor = 0xffff0000;
       });

      }else{
        setState(() {
          result = "OOps, algo deu errado! $ex";
          cor = 0xffff0000;
        });

      }
    }on FormatException{
      setState(() {
        result = "Você pressionou o botão de voltar antes de escanear.";
        cor = 0xffff0000;
      });
    }catch(ex){
      setState(() {
          result = "OOps, algo deu errado! $ex";
          cor = 0xffff0000;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(
            result,
             textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 20,
                 color: Color(cor)),
                 )
        ),
        backgroundColor: Color(0xff041a1a) ,
      ),
      body: Container(
        color: Color(0xff041a1a),
        child: SafeArea(
          child: Center(
            child: Image.asset("assets/augmented-reality.png"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Escanear"),
        backgroundColor: Color(0xffffbf2c),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,      
    );
  }
}