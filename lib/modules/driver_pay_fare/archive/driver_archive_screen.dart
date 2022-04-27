import 'package:flutter/material.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class DriverArchiveScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildArchive(),
                separatorBuilder: (context, index) =>SizedBox(
                  height: 10,
                ),
                itemCount: 10),
          ],
        ),
      ),
    );
  }

  Widget buildArchive() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text('Ride Number ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text('00 ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration:BoxDecoration(
                    color: MyColors.lightGrey,
                    // border: Border.all(color: defaultColor,
                    //     width: 10),
                    borderRadius: BorderRadius.circular(20.0,),
                  ) ,

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text('Date of Ride ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text('00/00/0000 ',
                          style: TextStyle(
                            fontSize: 18.0,
                            // fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration:BoxDecoration(
                    color: MyColors.lightGrey,
                    // border: Border.all(color: defaultColor,
                    //     width: 10),
                    borderRadius: BorderRadius.circular(15.0,),
                  ) ,

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text('Total Amount ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text('00 ',
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontWeight: FontWeight.bold,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration:BoxDecoration(
                    color: MyColors.lightGrey,
                    // border: Border.all(color: defaultColor,
                    //     width: 10),
                    borderRadius: BorderRadius.circular(20.0,),
                  ) ,

                ),
              ),

            ]
        ),
      ),
      decoration: BoxDecoration(
        color: defaultColor,
        // border: Border.all(color: defaultColor,
        //     width: 10),
        borderRadius: BorderRadius.circular(20.0,),
      ),
    ),
  );
}
