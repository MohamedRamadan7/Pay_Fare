
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanQrScreen> {
  var qrstr = "let's Scan it";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Scanning QR code'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(qrstr,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30),),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: scanQr,
                  child: Text(('Scanner'))),
            ],
          ),
        )
    );
  }


  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          qrstr=value;
        });
      });
    }catch(e){
      setState(() {
        qrstr='unable to read this';
      });
    }
  }
}