import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:res_tourism/adminPanel.dart';
import 'package:res_tourism/firebase_options.dart';
import 'package:res_tourism/home_screen.dart';
import 'package:res_tourism/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tourism Guid",
      home: AdminPanel()
    );
  }
}
class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.GuidName, required this.GuidPhone, required this.GuidRate,});

  final String GuidName;
  final String GuidPhone;
  final String GuidRate;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  final TextEditingController GuidName = TextEditingController();
  final TextEditingController GuidPhone = TextEditingController();
  final TextEditingController GuidRate = TextEditingController();

  @override
  void init(){
   GuidName.text = widget.GuidName;
   GuidPhone.text = widget.GuidPhone;
   GuidRate.text = widget.GuidRate;
  }

  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    var MaxWidth = 1;
    var MaxHieght = 1;
    return  Scaffold(
      resizeToAvoidBottomInset:  false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // height: _mediaQuery.size.height * MaxHieght / 15,
            color: Colors.orange,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: _mediaQuery.size.width * MaxHieght / 3.5,
                  top:_mediaQuery.size.height * MaxHieght / 70,
              bottom: _mediaQuery.size.height * MaxHieght / 70),
              child: Text('Update Guid',style:  TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: _mediaQuery.size.width * MaxWidth /15),),
            ),
          ),
          SizedBox(height: _mediaQuery.size.height* MaxHieght /40,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * MaxHieght / 150,
                horizontal: _mediaQuery.size.width * MaxWidth / 15),
            child: TextFormField(
              // controller: GuidName,
              validator: (value) {
                if(value == null || value.isEmpty || value == "  "){
                  return "Invalid Name ";
                }else{
                  return null;
                }
              },
              style: TextStyle(
                  fontSize: _mediaQuery.size.width * MaxWidth / 24,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  hoverColor: Colors.orange,
                  label: Text('Guid Name',style: TextStyle(
                    fontWeight: FontWeight.w700,),),
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: _mediaQuery.size.width *
                          MaxWidth /
                          25),
                  suffixIcon: Icon(
                    Icons.person,
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
              controller: GuidPhone,
              validator: (value) {
                if(value == null || value.isEmpty || value == "  "){
                  return "Invalid Phone ";
                }else{
                  return null;
                }
              },
              style: TextStyle(
                  fontSize: _mediaQuery.size.width * MaxWidth / 24,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  hoverColor: Colors.orange,
                  label: Text('Guid Phone',style: TextStyle(
                    fontWeight: FontWeight.w700,),),
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: _mediaQuery.size.width *
                          MaxWidth /
                          25),
                  suffixIcon: Icon(
                    Icons.phone,
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
              controller: GuidRate,
              validator: (value) {
                if(value == null || value.isEmpty || value == "  "){
                  return "Invalid Price";
                }else{
                  return null;
                }
              },
              style: TextStyle(
                  fontSize: _mediaQuery.size.width * MaxWidth / 24,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  hoverColor: Colors.orange,
                  label: Text('Guid Rate',style: TextStyle(
                    fontWeight: FontWeight.w700,),),
                  labelStyle: TextStyle(color: Colors.black,
                      fontSize: _mediaQuery.size.width *
                          MaxWidth /
                          25),
                  suffixIcon: Icon(
                    Icons.attach_money_outlined,
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
          SizedBox(height: _mediaQuery.size.height*0.06,),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(_mediaQuery.size.width * MaxWidth / 50),
            ),
            width: _mediaQuery.size.width * MaxWidth / 1.5,
            child: ElevatedButton(
                style:ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange)
                ),
                onPressed: (){
                  // insertImage();
                }, child: Text("Update",style: TextStyle(
                fontSize: _mediaQuery.size.width * MaxWidth / 18,
                color: Colors.white
            ),)),
          )
        ],
      ),
    );
  }
}

