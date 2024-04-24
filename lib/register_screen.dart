import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {

  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPass = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void registeruser()async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail.text, password: userPass.text);
      Timer(Duration (milliseconds: 500), () {
        userEmail.clear();
        userPass.clear();
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_Screen(),));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Register")));
    }on FirebaseAuthException catch (ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code.toString())));
    }
  }
  @override
  void dispose() {
    userEmail.dispose();
    userPass.dispose();
    super.dispose();
  }

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
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(_mediaQuery.size.width * MaxWidth /5),)
                  ),
                  padding: EdgeInsets.only(top: _mediaQuery.size.height * MaxHieght / 7,
                      left: _mediaQuery.size.width * MaxWidth / 3.5),
                  width: double.infinity,
                  height: _mediaQuery.size.height * MaxHieght /3,
                  child: Text('Register',style:  TextStyle(
                      fontSize: _mediaQuery.size.width * MaxHieght / 9,
                      fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(height: _mediaQuery.size.height * MaxHieght / 100,),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * MaxHieght / 150,
              //       horizontal: _mediaQuery.size.width * MaxWidth / 15),
              //   child: TextFormField(
              //     controller: userName,
              //     validator: (value) {
              //       if(value == null || value.isEmpty || value == "  "){
              //         return "Invalid Name ";
              //       }
              //     },
              //     style: TextStyle(
              //         fontSize: _mediaQuery.size.width * MaxWidth / 24,
              //         fontWeight: FontWeight.w700),
              //     decoration: InputDecoration(
              //         hoverColor: Colors.orange,
              //         label: Text('Enter Your Name',style: TextStyle(
              //           fontWeight: FontWeight.w700,),),
              //         labelStyle: TextStyle(color: Colors.black,
              //             fontSize: _mediaQuery.size.width *
              //                 MaxWidth /
              //                 25),
              //         suffixIcon: Icon(
              //           Icons.mail_outline,
              //           color: Colors.orange,
              //           size:
              //           _mediaQuery.size.width * MaxWidth / 13,
              //         ),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(20),
              //             borderSide:
              //             BorderSide(color: Colors.white,) ),
              //         enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(
              //               color: Colors.transparent,
              //             )),
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(18),
              //             borderSide: BorderSide(
              //               color: Colors.orange,
              //               width: _mediaQuery.size.width * MaxWidth / 130,
              //             ))),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * MaxHieght / 150,
                    horizontal: _mediaQuery.size.width * MaxWidth / 15),
                child: TextFormField(
                  controller: userEmail,
                  validator: (value) {
                    if(value == null || value.isEmpty || value == " "){
                      return "Invalid Email ";
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
                padding: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * MaxHieght / 150,
                    horizontal: _mediaQuery.size.width * MaxWidth / 15),
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
                        Icons.password,
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
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * MaxWidth / 15),
              //   child: TextFormField(
              //     controller: userCPass,
              //     validator: (value) {
              //       if(value == null || value.isEmpty || value == "  "){
              //         return "Not Same Password";
              //       }
              //     },
              //     style: TextStyle(
              //         fontSize: _mediaQuery.size.width * MaxWidth / 24,
              //         fontWeight: FontWeight.w700),
              //     decoration: InputDecoration(
              //         hoverColor: Colors.orange,
              //         label: Text('Confirm Password',style: TextStyle(
              //           fontWeight: FontWeight.w700,),),
              //         labelStyle: TextStyle(color: Colors.black,
              //             fontSize: _mediaQuery.size.width *
              //                 MaxWidth /
              //                 25),
              //         suffixIcon: Icon(
              //           Icons.password_outlined,
              //           color: Colors.orange,
              //           size:
              //           _mediaQuery.size.width * MaxWidth / 13,
              //         ),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(20),
              //             borderSide:
              //             BorderSide(color: Colors.white,) ),
              //         enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(
              //               color: Colors.transparent,
              //             )),
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(18),
              //             borderSide: BorderSide(
              //               color: Colors.orange,
              //               width: _mediaQuery.size.width * MaxWidth / 130,
              //             ))),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * MaxHieght / 15,
                    horizontal: _mediaQuery.size.width * MaxWidth / 15),
                width: double.infinity,
                // height: _mediaQuery.size.height * MaxHieght /18,
                child: ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate() ){
                    // debugPrint(userName.text);
                    // debugPrint(userEmail.text);
                    // debugPrint(userPass.text);
                    // debugPrint(userCPass.text);
                    // userName.clear();
                    // userCPass.clear();
                    registeruser();
                  }
                },
                    style: ButtonStyle(overlayColor: MaterialStatePropertyAll(
                        Colors.white12),
                        backgroundColor: MaterialStatePropertyAll(Colors.orange)
                    ),
                    child: Text('Register',
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


