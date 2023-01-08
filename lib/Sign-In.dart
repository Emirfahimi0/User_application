import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_application/Home_pages/UserProfile.dart';
import 'package:user_application/Sign-Up.dart';
import 'text_widget.dart';





class SignIn extends StatefulWidget {
  const SignIn( {Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;




  void  _signIn(String email, pass) async {
    final prefs = await SharedPreferences.getInstance();
    var url = 'https://reqres.in/api/login';
    try{
      Response res = await post(Uri.parse(url),
          body:{
            'email':email,
            'password':pass

          }

      );

      if (res.statusCode == 200){

        print("Login Successful");
        await prefs.setString('email', email);

        Navigator.push(context, MaterialPageRoute(builder: (context)=>userProfile(email)));
        setState(() {

          isLoading=true;
        });


      }
      else {
          print("failed");

      }

    }
    catch(e){
      print(e.toString());
    }


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return
      Scaffold(
          appBar: AppBar(
            leading:IconButton(
              padding: const EdgeInsets.only(left: 30),
              icon:const Icon(Icons.arrow_back_ios, color:Color(0xFF33E364)),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: const Color(0xFFffffff),
          body:
          Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:height*0.05),
                  TextWidget(text:"Hello", fontSize:26, isUnderLine:false),
                  TextWidget(text:"Welcomed !", fontSize:26, isUnderLine:false),
                  SizedBox(height:height*0.05),
                  TextInput(textString:"Email", textController:emailController, obscureText:false),
                  SizedBox(height: height*.05,),
                  TextInput(textString:"Password", textController:passController, obscureText:true),
                  SizedBox(height: height*.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text:"Sign In", fontSize:22, isUnderLine:false),
                      GestureDetector(
                          onTap: (){

                            _signIn(emailController.text.toString(), passController.text.toString());

                          },
                          child:
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              shape:BoxShape.circle,
                              color:Color(0xFF33E364),
                            ),
                            child: const Icon(Icons.arrow_forward, color:Colors.white, size:30),
                          )
                      )
                    ],
                  ),
                  SizedBox(height:height*0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                        },
                        child:TextWidget(text:"Sign Up", fontSize:16, isUnderLine:true),
                      ),
                      GestureDetector(
                        onTap: (){


                        },
                        child:TextWidget(text:"Forgot Password", fontSize:16, isUnderLine:true),

                      )
                    ],
                  )
                ],
              ),
            ),
          )
      );


  }
}


class TextInput extends StatelessWidget {
  final String textString;
  TextEditingController textController;
  final bool obscureText;
  TextInput({Key? key, required this.textString, required this.textController, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Color(0xFF000000)),
      cursorColor: const Color(0xFF9b9b9b),
      controller: textController,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: this.textString,
        hintStyle: const TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
