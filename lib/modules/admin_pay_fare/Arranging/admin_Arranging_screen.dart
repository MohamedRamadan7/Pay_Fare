import 'package:flutter/material.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class AdminArrangingScreen extends StatelessWidget {

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
                itemBuilder: (context, index) => buildArranging(),
                separatorBuilder: (context, index) =>SizedBox(
                  height: 20,
                ),
                itemCount: 10),
          ],
        ),
      ),

    );
  }

  Widget buildArranging() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      children: [
        defaultButton(
        width: 115,
        fontColor: Colors.black,
        function: ()
        {
          //  navigateTo(context, widget);
        },
        text: 'The Turn',
        isUberCase: false,
          radius: 30
    ),
        SizedBox(
          width: 20,
        ),
        Container(
          width:230,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text('Car Id ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,

                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  ),


                ]
            ),
          ),
          decoration: BoxDecoration(
            color: defaultColor,
            // border: Border.all(color: defaultColor,
            //     width: 10),
            borderRadius: BorderRadius.circular(40.0,),
          ),
        )
      ],
    ),
  );
}
