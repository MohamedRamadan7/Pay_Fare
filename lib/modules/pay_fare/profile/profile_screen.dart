import 'package:flutter/material.dart';
import 'package:pay_fare/modules/pay_fare/login/app_login_screen.dart';
import 'package:pay_fare/shared/components/components.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/O6bNpvDPClvYntJEOxbM7w-UNtoJf0Xcj6JyY2zJZOYlkSd8F3AufC20SJXKUncqGxk=s200'),
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

          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Your Account',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.person),
                    Text('Personal information',
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.credit_card),
                    Text('Accounts&Credits',
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.notifications),
                    Text('Notifications',
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
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.help),
                    Text('Help',
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.star_half_outlined),
                    Text('Rate',
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

            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Settings',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.language),
                    Text('Language',
                      style: TextStyle(
                        fontSize: 20.0,
                      //  fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.brightness_medium_outlined),
                    Text('Dark mode',
                      style: TextStyle(
                        fontSize: 20.0,
                       // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.toggle_off_outlined ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(thickness: 1,indent: 50,endIndent: 50),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout),
                TextButton(
                  onPressed: ()
                  {
                    navigateAndFinish(context, AppLoginScreen());
                  },
                  child: Text(
                  'LogOut',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
