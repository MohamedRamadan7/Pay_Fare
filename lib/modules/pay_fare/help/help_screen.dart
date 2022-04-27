import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Support inbox',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Divider(thickness: 1,indent: 0,endIndent: 0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.message),
                          Text('Read message',
                            style: TextStyle(
                              fontSize: 20.0,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    Divider(thickness: 1,indent: 0,endIndent: 0),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Learn more',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(thickness: 1,indent: 0,endIndent: 0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.directions_car),
                      Text('Car',
                        style: TextStyle(
                          fontSize: 20.0,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                Divider(thickness: 1,indent: 0,endIndent: 0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.history),
                      Text('History',
                        style: TextStyle(
                          fontSize: 20.0,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                Divider(thickness: 1,indent: 0,endIndent: 0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.security),
                      Text('Safety & security',
                        style: TextStyle(
                          fontSize: 20.0,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                Divider(thickness: 1,indent: 0,endIndent: 0),
              ],
            )
          ],
        ),
      ),
    );
  }
}
