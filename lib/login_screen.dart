import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:res_tourism/home_screen.dart';
import 'package:res_tourism/register_screen.dart';

import 'adminPanel.dart';


class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPass = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void Loginuser()async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail.text, password: userPass.text);
      if(userEmail.text == 'Shaun@gmail.com' && userPass.text == "Shaun123"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPanel(),));
      }
      // Timer(Duration (milliseconds: 500), () {
      //   userEmail.clear();
      //   userPass.clear();
      // });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Login")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home_Screen(),));
    }on FirebaseAuthException catch (ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code.toString())));
    }
  }
  // @override
  // void dispose() {
  //   userEmail.dispose();
  //   userPass.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    var MaxWidth = 1;
    var MaxHieght = 1;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Center(
                child:Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(
                      _mediaQuery.size.width * MaxWidth /5),)
                  ),
                  padding: EdgeInsets.only(top: _mediaQuery.size.height * MaxHieght / 7,
                  left: _mediaQuery.size.width * MaxWidth / 3),
                  width: double.infinity,
                  height: _mediaQuery.size.height * MaxHieght /3,

                  child: Text('Login',style:  TextStyle(
                      fontSize: _mediaQuery.size.width * MaxHieght / 9,
                      fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(height: _mediaQuery.size.height * MaxHieght / 20,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * MaxHieght / 30,
                    horizontal: _mediaQuery.size.width * MaxWidth / 15),
                child: TextFormField(
                  controller: userEmail,
                  validator: (value) {
                    if(value == null || value.isEmpty || value == " "){
                      return "Invalid Email";
                    }else{
                      return null;
                    }
                  },
                  style: TextStyle(
                      fontSize: _mediaQuery.size.width * MaxWidth / 24,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                      hoverColor: Colors.orange,
                      label: Text('Enter Your Email',style: TextStyle(
                        fontWeight: FontWeight.w700,),),
                      labelStyle: TextStyle(color: Colors.black,
                          fontSize: _mediaQuery.size.width *
                              MaxWidth /
                              25),
                      suffixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.orange,
                        size:
                        _mediaQuery.size.width * MaxWidth / 13,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                          BorderSide(color: Colors.white,) ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(
                            color: Colors.orange,
                            width: _mediaQuery.size.width * MaxWidth / 130,
                          ))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * MaxWidth / 15),
                child: TextFormField(
                  controller: userPass,
                  validator: (value) {
                    if(value == null || value.isEmpty || value == "  "){
                      return "Incorrect Password";
                    }else{
                      return null;
                    }
                  },
                  style: TextStyle(
                      fontSize: _mediaQuery.size.width * MaxWidth / 24,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                      hoverColor: Colors.orange,
                      label: Text('Enter Your Password',style: TextStyle(
                        fontWeight: FontWeight.w700,),),
                      labelStyle: TextStyle(color: Colors.black,
                          fontSize: _mediaQuery.size.width *
                              MaxWidth /
                              25),
                      suffixIcon: Icon(
                        Icons.password_outlined,
                        color: Colors.orange,
                        size:
                        _mediaQuery.size.width * MaxWidth / 13,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                          BorderSide(color: Colors.white,) ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(
                            color: Colors.orange,
                            width: _mediaQuery.size.width * MaxWidth / 130,
                          ))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Are You New?     Go to',style: TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: _mediaQuery.size.width * MaxWidth / 30),),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register_Screen(),));
                  }, style: ButtonStyle(backgroundColor:
                  MaterialStatePropertyAll(Colors.white),
                      overlayColor: MaterialStatePropertyAll(Colors.orange)),
                      child: Text('Register Page',style:
                      TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: _mediaQuery.size.width * MaxWidth / 25),))
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * MaxHieght / 15,
                    horizontal: _mediaQuery.size.width * MaxWidth / 15),
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    Loginuser();
                  }
                },
                    style: ButtonStyle(overlayColor: MaterialStatePropertyAll(
                        Colors.white12),
                        backgroundColor: MaterialStatePropertyAll(Colors.orange)
                    ),
                    child: Text('Login',
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: _mediaQuery.size.width * MaxWidth / 15),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}