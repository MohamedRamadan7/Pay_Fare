import 'package:flutter/material.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard( {Key? key,required this.balance}) : super(key: key);
  final double balance ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .22,
            color: LightColor.navyBlue1,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total Balance',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Text(
                    //       '6,354',
                    //       style: TextStyle(
                    //
                    //           fontSize: 35,
                    //           fontWeight: FontWeight.w800,
                    //           color: Color(0xffe7ad03)),
                    //     ),
                    //     Text(
                    //       ' MLR',
                    //       style: TextStyle(
                    //           fontSize: 35,
                    //           fontWeight: FontWeight.w500,
                    //           color: Color(0xfffbbd5c).withAlpha(200)),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Text(
                    //       'Eq:',
                    //       style: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w600,
                    //           color: Color(0xff6d7f99)),
                    //     ),
                    //     Text(
                    //       ' \$10,000',
                    //       style: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.white),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$balance',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        Text('L.E',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //     width: 85,
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.all(Radius.circular(12)),
                    //         border: Border.all(color: Colors.white, width: 1)),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: <Widget>[
                    //         Icon(
                    //           Icons.add,
                    //           color: Colors.white,
                    //           size: 20,
                    //         ),
                    //         SizedBox(width: 5),
                    //         Text("Top up",
                    //             style: TextStyle(color: Colors.white)),
                    //       ],
                    //     ))
                  ],
                ),
                Positioned(
                  left: -170,
                  top: -170,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Color(0xff3554d3),
                  ),
                ),
                Positioned(
                  left: -160,
                  top: -190,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Color(0xff375efd),
                  ),
                ),
                Positioned(
                  right: -170,
                  bottom: -170,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Color(0xffe7ad03),
                  ),
                ),
                Positioned(
                  right: -160,
                  bottom: -190,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Color(0xfffbbd5c),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
