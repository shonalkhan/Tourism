import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:res_tourism/main.dart';
import 'package:uuid/uuid.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final TextEditingController GuidName = TextEditingController();
  final TextEditingController GuidPhone = TextEditingController();
  final TextEditingController GuidRate = TextEditingController();
  File? GuidPic;

  void insertImage() async{
    UploadTask uploadTask = FirebaseStorage.instance.ref().child('images').child('Guid').putFile(GuidPic!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String DownloadUrl = await taskSnapshot.ref.getDownloadURL();
    insertData(image: DownloadUrl);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Insertes')));
    Timer(Duration (milliseconds: 500), () {
      GuidName.clear();
      GuidPhone.clear();
      GuidRate.clear();
    });
  }
  void insertData({String? image}) async{
    var UserID = Uuid().v1();
    Map<String , dynamic> Tourism_data = {
      "UserId": UserID,
      "Gname" : GuidName.text.toString(),
      "GPhone" : GuidPhone.text.toString(),
      "PImage" : image,
      "GRate" : GuidRate.text.toString(),
    };
    await FirebaseFirestore.instance.collection('Guid').doc(UserID).set(Tourism_data);
  }
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    var MaxWidth = 1;
    var MaxHieght = 1;
    return Scaffold(
      resizeToAvoidBottomInset:  false,
      appBar: AppBar(
        toolbarHeight: _mediaQuery.size.height * MaxHieght / 12,
        backgroundColor: Colors.orange,
        leading: Icon(Icons.account_balance,size: _mediaQuery.size.width * MaxWidth/12,),
        title: Text('Admin DashBoard',style:  TextStyle(fontWeight: FontWeight.w900,
            fontSize:  _mediaQuery.size.width * MaxWidth /16),
        ),
      ),
      endDrawer: Drawer(
        width: _mediaQuery.size.width * MaxWidth / 1.5,
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
              drawerHeader(),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile' , style: TextStyle(fontWeight: FontWeight.w700,)),
                subtitle: Text('Modify Your Profile'),
                trailing: Icon(Icons.chevron_right),
              ),
            ]
        ),
      ),

      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Guid').snapshots(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              if(snapshot.hasData){
                var dataL = snapshot.data!.docs.length;
                return  dataL != 0 ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dataL,
                  itemBuilder: (context, index)
                  {
                    String UserID = snapshot.data!.docs[index]['UserId'];
                    String GuidName = snapshot.data!.docs[index]['Gname'];
                    String GuidPhpne = snapshot.data!.docs[index]['GPhone'];
                    String GuidRate = snapshot.data!.docs[index]['GRate'];
                    String Gimage = snapshot.data!.docs[index]['PImage'];
                    return Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth /20,
                              top: _mediaQuery.size.height * MaxHieght /30),
                          child: Column(
                            children: [
                              CircleAvatar(backgroundImage:NetworkImage(Gimage),
                                radius: _mediaQuery.size.width * MaxWidth / 15,
                                backgroundColor: Colors.orange,)
                            ],
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.only(
                              left: _mediaQuery.size.width * MaxWidth /30 ,
                              top: _mediaQuery.size.height * MaxHieght /25),
                          child: Column(
                            children: [
                              Text(GuidName,
                                style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /18,
                                    fontWeight: FontWeight.w700),)
                            ],
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.only(
                              left: _mediaQuery.size.width * MaxWidth /30,
                              top: _mediaQuery.size.height * MaxHieght /20),
                          child: Column(
                            children: [
                              Text(GuidPhpne,
                                style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /25,
                                    fontWeight: FontWeight.w700),)],
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.only(
                              left: _mediaQuery.size.width * MaxWidth /30,
                              top: _mediaQuery.size.height * MaxHieght /20),
                          child: Column(children: [
                            Text(GuidRate,
                              style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /25,
                                  fontWeight: FontWeight.w700),)],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton.icon(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateScreen(GuidName: GuidName, GuidPhone: GuidPhpne, GuidRate: GuidRate),));
                            }, 
                              icon: Icon(Icons.update,color: CupertinoColors.activeGreen,
                              size: _mediaQuery.size.width * MaxWidth /15,),
                                style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.orange)),
                                label: Text('Update',style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth / 22),)),
                            TextButton.icon(onPressed: () async{
                              await FirebaseFirestore.instance.collection('Guid').doc(UserID).delete();
                            }, icon: Icon(Icons.delete,color: Colors.red,
                              size: _mediaQuery.size.width * MaxWidth /15,),
                                style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.orange)),
                                label: Text('Delete',style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth / 22),)),
                          ],
                        ),
                        SizedBox(height: _mediaQuery.size.height * MaxHieght /18)
                      ],
                    );
                  },
                ) : Center(child: Text('Insert For Results'),);
              };

              if(snapshot.hasError){
                return Icon(Icons.error,color: Colors.red,);
              }

              return Container();
            },
          ),

          Padding(
            padding:EdgeInsets.only(top: _mediaQuery.size.height * MaxHieght / 5),
            child: FloatingActionButton.small(onPressed: (){
              showModalBottomSheet(context: context, builder: (context)  {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap:() async{
                            XFile? selectedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
                            if(selectedImage!=null)
                            {
                              File image=File(selectedImage.path);
                              setState(() {
                                GuidPic=image;
                              });
                            }

                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * MaxHieght / 150,
                                horizontal: _mediaQuery.size.width * MaxWidth / 15),
                            child: CircleAvatar(
                              child: Icon(Icons.add_photo_alternate_outlined,size: _mediaQuery.size.width * MaxWidth / 6,color: Colors.orange,),
                              radius: _mediaQuery.size.width*0.2,
                              backgroundImage: GuidPic!=null?FileImage(GuidPic!):null,
                            ),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: _mediaQuery.size.height * MaxHieght / 30
                        ),
                        child: Text('Add guid',style:  TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: _mediaQuery.size.width * MaxWidth /20),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: _mediaQuery.size.height * MaxHieght / 150,
                            horizontal: _mediaQuery.size.width * MaxWidth / 15),
                        child: TextFormField(
                          controller: GuidName,
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
                      SizedBox(height: _mediaQuery.size.height*0.02,),
                      ElevatedButton(
                          style:ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.orange)
                          ),
                          onPressed: (){
                            insertImage();
                          }, child: Text("Add",style: TextStyle(
                          color: Colors.white
                      ),))
                    ],
                  ),
                );
              });
            },splashColor: Colors.orange ,
              child: Center(child: Icon(Icons.add_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
drawerHeader(){
  return DrawerHeader(
    decoration: BoxDecoration(
        color: Colors.orange),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          //image
          backgroundImage: AssetImage('images/shaun1.jpg'),
          radius: 40,
        ),
        Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 2)),
            Container(
                child:
            Text('Hey Shaun',style: TextStyle(fontSize: 10),)),
            Text('Shaunkhan458@gmail.com' ,style:  TextStyle(fontWeight: FontWeight.w700 , fontSize: 8),)
          ],
        ),
      ],
    ),
  );

}