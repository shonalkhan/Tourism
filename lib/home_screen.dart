import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:res_tourism/login_screen.dart';
import 'package:res_tourism/reusablewedgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'adminPanel.dart';

 class Home_Screen extends StatefulWidget {
   const Home_Screen({super.key});

   @override
   State<Home_Screen> createState() => _Home_ScreenState();
 }

 class _Home_ScreenState extends State<Home_Screen> {
   String? DDvalue = "Logout";

   @override
   Widget build(BuildContext context) {

     var _mediaQuery = MediaQuery.of(context);
     var MaxWidth = 1;
     var MaxHieght = 1;
     String Dvalue = 'One';
     return  Scaffold(
       resizeToAvoidBottomInset: false,
       backgroundColor: Colors.grey.shade100,
       body: SingleChildScrollView(
         physics: ScrollPhysics(),
         scrollDirection: Axis.vertical,
         child: Center(
           child: Column(
             children: [
               SizedBox(width: double.infinity, height: _mediaQuery.size.height * MaxHieght /30,),
               Row(
                 children: [
                   Stack(
                     children: [
                       Container(
                         margin: EdgeInsets.only(
                             left: _mediaQuery.size.width * MaxWidth / 15,
                             top: _mediaQuery.size.height * MaxHieght / 35),
                              child: CircleAvatar(
                             backgroundColor: Colors.brown,
                             radius: _mediaQuery.size.width * MaxWidth / 13,
                             child: Container(
                               width: _mediaQuery.size.width * MaxWidth / 8,
                               height: _mediaQuery.size.width * MaxHieght /8,
                             ),
                           ),
                       ),
                       Container(
                         width: _mediaQuery.size.width * MaxWidth / 2,
                         // height: _mediaQuery.size.height*1.1/8,
                         // color: Colors.brown ,
                         margin: EdgeInsets.only(
                             left: _mediaQuery.size.width * MaxWidth / 4.5,
                             top: _mediaQuery.size.height * MaxHieght / 35),
                         child: RichText(
                             text: TextSpan(
                                 text: '  Welcome Back',
                                 style: TextStyle(color: Colors.black,
                                     fontSize: _mediaQuery.size.width *
                                         MaxWidth /
                                         22),
                                 children: [
                                   TextSpan(
                                     text: '\n Shonal Khan',
                                     style: TextStyle(color: Colors.black,
                                         fontSize: _mediaQuery.size.width *
                                             MaxWidth /
                                             15,
                                         fontWeight: FontWeight.w900),
                                   ),
                                 ])),
                       ),
                       Container(
                         margin: EdgeInsets.only(
                             left: _mediaQuery.size.width * MaxWidth / 1.8,
                             top: _mediaQuery.size.height * MaxHieght / 35),
                         child: Icon(Icons.waving_hand,
                             color: Colors.orange,
                             size: _mediaQuery.size.width * MaxWidth / 15),
                       ),
                       Container(
                         margin: EdgeInsets.only(
                             left: _mediaQuery.size.width * MaxWidth / 2.25,
                             top: _mediaQuery.size.height * MaxHieght / 32
                         ),
                         child: DropdownButton<String>(
                           menuMaxHeight: _mediaQuery.size.height * MaxHieght /5,
                             underline: Container( color: Colors.transparent,),
                             icon: Icon(Icons.notification_add_outlined,
                             color: Colors.orange,
                             size: _mediaQuery.size.width * MaxWidth / 7,),
                             style: TextStyle(color: Colors.black),
                             items: [
                               DropdownMenuItem<String>(
                                   value: 'One',
                                   onTap: (){},
                                   child: TextButton.icon(onPressed: (){
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_Screen(),));
                                   }, icon: Icon(Icons.logout,color: Colors.red,size: _mediaQuery.size.width * MaxWidth / 15,), label: Text('Logout',
                                     style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth / 17),))),
                               DropdownMenuItem<String>(
                                   onTap: (){},
                                   value: 'Two',
                                   child: TextButton.icon(onPressed: (){
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminPanel(),));
                                   }, icon: Icon(Icons.admin_panel_settings_outlined,color: Colors.orange,size: _mediaQuery.size.width * MaxWidth / 15,), label: Text('A.Panel'
                                   ,style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth / 17),))),
                               DropdownMenuItem<String>(
                                   onTap: (){},
                                   value: 'Three',
                                   child: TextButton.icon(onPressed: (){
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_Screen(),));
                                   }, icon: Icon(Icons.login,color: Colors.green,size: _mediaQuery.size.width * MaxWidth / 15,), label: Text('Login',
                                     style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth / 17),))),
                             ],
                             onChanged: (String? NValue){
                               setState(() {
                                 Dvalue = NValue!;
                               });
                             }
                         )
                       ),
                     ],
                   )
                 ],
               ),
               Row(
                 children: [
                   Stack(
                     children: [
                       Container(
                           margin: EdgeInsets.only(
                               top: _mediaQuery.size.height * MaxHieght / 35,
                               left: _mediaQuery.size.width * MaxWidth / 15),
                           width: _mediaQuery.size.width * MaxWidth / 1.15,
                           // height: _mediaQuery.size.height * MaxHieght/14,
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(20)),
                           child: TextField(
                             style: TextStyle(
                                 fontSize:
                                 _mediaQuery.size.width * MaxWidth / 24,
                                 fontWeight: FontWeight.w700),
                             decoration: InputDecoration(
                                 hintText: 'Discover a City',
                                 hintStyle: TextStyle(
                                     fontSize: _mediaQuery.size.width *
                                         MaxWidth /
                                         25),
                                 prefixIcon: Icon(
                                   Icons.search,
                                   color: Colors.orange,
                                   size:
                                   _mediaQuery.size.width * MaxWidth / 13,
                                 ),
                                 border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20),
                                     borderSide:
                                     BorderSide(color: Colors.white)
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                     borderSide: BorderSide(
                                       color: Colors.transparent,
                                     )
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(20),
                                     borderSide: BorderSide(
                                       color: Colors.orange,
                                       width: _mediaQuery.size.width *
                                           MaxWidth /
                                           130,
                                     )
                                 )
                             ),
                           )
                       ),
                     ],
                   )
                 ],
               ),
               SingleChildScrollView(
                 physics: BouncingScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     ReusablePlaces(),
                     ReusablePlaces(),
                     ReusablePlaces(),
                     ReusablePlaces(),
                   ],
                 ),
               ),
               Row(
                 children: [
                   Container(
                     margin: EdgeInsets.only(
                         left: _mediaQuery.size.width * MaxWidth / 15,
                         top: _mediaQuery.size.height * MaxHieght / 90),
                     child: Text(
                       'Explore Cities',
                       style: TextStyle(
                           fontSize: _mediaQuery.size.width * MaxWidth / 15,
                           fontWeight: FontWeight.w900),
                     ),
                   )
                 ],
               ),
               SingleChildScrollView(
                 physics: BouncingScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     Padding(
                         padding: EdgeInsets.only(
                             left: _mediaQuery.size.width * MaxWidth / 20,
                             top: _mediaQuery.size.height * MaxHieght / 30)),
                     IconButton(
                         onPressed: () {
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPanel(),));
                         },
                         icon: Text(
                           'All',
                           style: TextStyle(
                               fontSize:
                               _mediaQuery.size.width * MaxWidth / 20),
                         )),
                     IconButton(
                         onPressed: () {},
                         icon: Text(
                           'Recommended',
                           style: TextStyle(
                               fontSize:
                               _mediaQuery.size.width * MaxWidth / 20),
                         )),
                     IconButton(
                         onPressed: () {},
                         icon: Text(
                           'Recently Viewed',
                           style: TextStyle(
                               fontSize:
                               _mediaQuery.size.width * MaxWidth / 20),
                         )),
                     IconButton(
                         onPressed: () {},
                         icon: Text(
                           'Nature',
                           style: TextStyle(
                               fontSize:
                               _mediaQuery.size.width * MaxWidth / 20),
                         )),
                     IconButton(
                         onPressed: () {},
                         icon: Text(
                           'Mountain',
                           style: TextStyle(
                               fontSize:
                               _mediaQuery.size.width * MaxWidth / 20),
                         ))
                   ],
                 ),
               ),
               SingleChildScrollView(
                 physics: BouncingScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     ReusableCiities(
                         mediaQuery: _mediaQuery,
                         MaxWidth: MaxWidth,
                         MaxHieght: MaxHieght),
                     ReusableCiities(
                         mediaQuery: _mediaQuery,
                         MaxWidth: MaxWidth,
                         MaxHieght: MaxHieght),
                     ReusableCiities(
                         mediaQuery: _mediaQuery,
                         MaxWidth: MaxWidth,
                         MaxHieght: MaxHieght),
                   ],
                 ),
               ),
               Row(
                 children: [
                   Container(
                     margin: EdgeInsets.only(
                         left: _mediaQuery.size.width * MaxWidth / 15,
                         top: _mediaQuery.size.height * MaxHieght / 30),
                     child: Text(
                       'Popular Categories',
                       style: TextStyle(
                           fontSize: _mediaQuery.size.width * MaxWidth / 15,
                           fontWeight: FontWeight.w900),
                     ),
                   ),
                 ],
               ),
               SingleChildScrollView(
                 physics: BouncingScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     ResuableCategories(
                         mediaQuery: _mediaQuery,
                         MaxWidth: MaxWidth,
                         MaxHieght: MaxHieght),
                     ResuableCategories(
                         mediaQuery: _mediaQuery,
                         MaxWidth: MaxWidth,
                         MaxHieght: MaxHieght),
                     ResuableCategories(
                         mediaQuery: _mediaQuery,
                         MaxWidth: MaxWidth,
                         MaxHieght: MaxHieght),
                     ResuableCategories(
                         mediaQuery: _mediaQuery,
                         MaxWidth: MaxWidth,
                         MaxHieght: MaxHieght),
                     ResuableCategories(
                         mediaQuery: _mediaQuery,
                         MaxWidth: MaxWidth,
                         MaxHieght: MaxHieght),
                     ResuableCategories(
                         mediaQuery: _mediaQuery,
                         MaxWidth: MaxWidth,
                         MaxHieght: MaxHieght),
                   ],
                 ),
               )
             ],
           ),
         ),
       ),
       bottomNavigationBar: Container(
         color: Colors.transparent,
         width: _mediaQuery.size.width * MaxWidth,
         // height:  _mediaQuery.size.width * MaxHieght/ 5,
         child: GNav(
             backgroundColor: Colors.transparent,
             gap: _mediaQuery.size.width * MaxWidth / 1000,
             tabMargin: EdgeInsets.only(
                 top: _mediaQuery.size.height * MaxHieght / 100),
             hoverColor: Colors.brown.shade300,
             tabBackgroundColor: Colors.transparent,
             textSize: _mediaQuery.size.height * MaxWidth / 50,
             iconSize: _mediaQuery.size.width * MaxWidth / 15,
             tabs: const [
               GButton(
                 icon: Icons.home,
                 text: 'Home',
               ),
               GButton(
                 icon: Icons.favorite,
                 text: 'Like',
               ),
               GButton(
                 icon: Icons.search,
                 text: 'Search',
               ),
               GButton(
                 icon: Icons.person,
                 text: 'Profile',
               ),
             ]
         ),
       ),
     );
   }
 }
