import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateQrScreen extends StatefulWidget {

  @override
  _CreateQrScreenState createState() => _CreateQrScreenState();
}

class _CreateQrScreenState extends State<CreateQrScreen> {
  var qrstr = 'Add Data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating QR code'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BarcodeWidget(
            data: qrstr,
            barcode: Barcode.qrCode(),
            color: Colors.blue,
            height: 250,
            width: 250,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .8,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  qrstr = value;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Enter your data here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2))),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
