import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                  [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                'https://play-lh.googleusercontent.com/O6bNpvDPClvYntJEOxbM7w-UNtoJf0Xcj6JyY2zJZOYlkSd8F3AufC20SJXKUncqGxk=s200'),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Mohamed Ramadan',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    Text('currant balance',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('00.00',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                          ),
                        ),
                        Text('L.E',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                  ]
                ),
                decoration: BoxDecoration(
                  color: MyColors.lightGrey,
                  border: Border.all(color: defaultColor,
                  width: 10),
                  borderRadius: BorderRadius.circular(20.0,),
                ),
              ),
              SizedBox(
                height:30.0 ,),
              Text('Transaction',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height:20.0 ,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      Row(
                        children: [
                          Image.asset('assets/images/minibus.png',
                            height: 80,
                            width:  80,
                            //color: Colors.grey[600],
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('EGP 30 ',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                      fontWeight: FontWeight.bold,

                                      color: Colors.black,
                                       // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('- Go ',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                       // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text('25 Nov,',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('2:30 pm ',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image.asset('assets/images/minibus.png',
                          //   height: 80,
                          //   width:  80,
                          //   //color: Colors.grey[600],
                          // ),
                          SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              Icon(Icons.import_export,
                                color: Colors.blue,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Talkha New Station,Al Mansoura',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                       // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text('Abboud Station,Cairo',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                       // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 350,
                        child: MaterialButton(
                          onPressed: (){},
                          child: Text('Sow more',
                            style: TextStyle(
                              fontSize: 20.0,
                              //fontWeight:FontWeight.bold,
                              color: MyColors.blue,

                            ),),

                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25,),
                          color: Colors.blue[200],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 350,
                        child: MaterialButton(
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.history),
                              Text('View past rides',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  //fontWeight:FontWeight.bold,
                                ),)
                            ],
                          ),

                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25,),
                          color: Colors.grey[400],
                        ),
                      ),
                    ]
                ),
                decoration: BoxDecoration(
                  color: MyColors.lightGrey,
                  // border: Border.all(color: defaultColor,
                  //     width: 10),
                  borderRadius: BorderRadius.circular(20.0,),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
