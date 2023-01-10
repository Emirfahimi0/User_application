import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_application/Sign-Up.dart';
import 'package:user_application/User.dart';
import 'package:user_application/api.dart';
import 'package:user_application/utils/Emoticons.dart';
import 'package:http/http.dart' as http;




class userProfile extends StatefulWidget {
  final String token;

   const userProfile(this.token,{Key? key}) : super(key: key);


  @override
  State<userProfile> createState() => _userProfileState();
}


class _userProfileState extends State<userProfile>  {




Future fetchApi() async {
  var url = 'https://reqres.in/api/users/4';
  String email;
  http.Response res ;
  try {
  res = await http.get(Uri.parse(url));
  if(res.statusCode==200){

    setState(() {
      //stringResponse = res.body;
      Map mapResponse= json.decode(res.body);
      Map dataResponse = mapResponse['data'];
      email = dataResponse['email'].toString();
      print(email);
    });

  }

  } catch (e) {
    print(e);
  }
}


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchApi();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                // Hi user
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi Eve!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8,
                      ),
                      Text('6 Jan 2022',
                        style: TextStyle(color: Colors.blue[100]),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Icon(Icons.add_circle,
                    color: Colors.white,

                  ),
                ),
              ],
            ),
            SizedBox(height: 20,
            ),
            //Search Bar
            Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(image:AssetImage('assets/user.png'),
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ],
                )
              ],
            ),

            ListTile(
              contentPadding:EdgeInsets.all(20),
              title: Center(
                child: Text('ABOUT ME',
                style: TextStyle(color: Colors.white,
                ),
                ),
              ),

              subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing onsequat.nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                style: TextStyle(color: Colors.white),

              ),
            ),
            SizedBox(height: 20,
            ),

            // How do you feel
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text("Yesterday's Activity?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.more_horiz,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 25,
            ),
            Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
              //bad
              Column(
                children: const [
                  EmoticonFace(
                      emoticonFace:'Made a mockup application for User Interface'
                  ),
                  SizedBox(height: 8,
                  ),
                  Text('',
                  style: TextStyle(color: Colors.white
                  ),
                  )
                ],
              ),
                Column(
                  children: [
                    EmoticonFace(
                        emoticonFace:'- Made a login url on flutter with api dummy'
                    ),
                    SizedBox(height: 8,
                    ),
                    Text('',
                      style: TextStyle(color: Colors.white
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    EmoticonFace(
                        emoticonFace:'- Made a user profile Interface'
                    ),
                    SizedBox(height: 8,
                    ),
                    Text('',
                      style: TextStyle(color: Colors.white
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));

                }, child: const Text('Logout')
                )


            ],
            )
          ],
          ),
        ),
      ),
    );

  }
}

class User{
  final String name,email,userName;
  User(this.name,this.email,this.userName);
}
