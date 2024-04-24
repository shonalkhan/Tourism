import 'package:flutter/material.dart';
import 'package:res_tourism/home_screen.dart';
import 'package:res_tourism/reusablewedgets.dart';

class DetailScreeen extends StatefulWidget {
  const DetailScreeen({super.key});

  @override
  State<DetailScreeen> createState() => _DetailScreeenState();
}

class _DetailScreeenState extends State<DetailScreeen> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    var MaxWidth = 1;
    var MaxHieght = 1;
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                TextButton.icon(onPressed: (){
                  Navigator.pop(context, MaterialPageRoute(builder: (context) => Home_Screen(),));
                }, icon: Icon(
                    Icons.arrow_back,size: _mediaQuery.size.width * MaxWidth / 17),
                    label: Text('Back',style: TextStyle(
                        fontSize: _mediaQuery.size.width * MaxWidth /17),
                    )
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: _mediaQuery.size.height * MaxHieght /50,
                      left: _mediaQuery.size.width * MaxWidth /25
                  ),
                  height:_mediaQuery.size.height * MaxHieght/2.4 ,
                  width: _mediaQuery.size.width * MaxWidth /1.1,
                  decoration:
                  BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(_mediaQuery.size.width * MaxWidth/20),
                      image: DecorationImage(image: AssetImage('images/Karachi.jpg'),fit: BoxFit.fill)
                  ),
                )
              ],
            ),

            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ReusableColumn(mediaQuery: _mediaQuery, MaxWidth: MaxWidth, MaxHieght: MaxHieght),
                  ReusableColumn(mediaQuery: _mediaQuery, MaxWidth: MaxWidth, MaxHieght: MaxHieght),
                  ReusableColumn(mediaQuery: _mediaQuery, MaxWidth: MaxWidth, MaxHieght: MaxHieght),
                  ReusableColumn(mediaQuery: _mediaQuery, MaxWidth: MaxWidth, MaxHieght: MaxHieght),
               ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth/14,
                  right: _mediaQuery.size.width * MaxWidth/14),
              child: Divider(
                color: Colors.black54,
              ),
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth /15,),
                      child: Text(
                        'Quid e Azam\nMosque ', style:
                      TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /15, fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: _mediaQuery.size.width * MaxWidth /1.6,),
                      child: IconButton(onPressed: (){}, icon:
                      Icon(Icons.star_rate,size: _mediaQuery.size.width * MaxWidth /15,
                        color: Colors.orangeAccent,)
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          top: _mediaQuery.size.height * MaxHieght /75,left: _mediaQuery.size.width * MaxWidth /1.4,),
                        child: RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                text: '4.9',style: TextStyle(fontWeight: FontWeight.w700,
                                  fontSize: _mediaQuery.size.width * MaxWidth /17),
                              ),
                              TextSpan(text: ' (9k Reviews)',
                                style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /35),
                              ),
                            ]
                        )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: _mediaQuery.size.height * MaxHieght / 22,
                          left: _mediaQuery.size.width * MaxWidth / 1.6),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.add_location,
                        color: Colors.red,size: _mediaQuery.size.width * MaxWidth /14,)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: _mediaQuery.size.height * MaxHieght / 15,
                          left: _mediaQuery.size.width * MaxWidth / 1.4),
                      child: Text('Map Direction' ,style: TextStyle(color: Colors.red,
                          fontSize:_mediaQuery.size.width * MaxWidth / 26,fontWeight: FontWeight.w700 ),),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding:EdgeInsets.only(
                      left: _mediaQuery.size.width * MaxWidth /15,
                      top: _mediaQuery.size.height * MaxHieght /40),
                  child: Text('Description',style: TextStyle(
                      fontSize: _mediaQuery.size.width * MaxWidth/16,fontWeight: FontWeight.w900)),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: _mediaQuery.size.width * MaxWidth / 15),
                child: Text('Thats the quick brown fox jumo over the lazy dog Thats the quick brown fox jumo over the lazy dog Thats the quick brown fox jumo over the lazy dog Thats the quick brown fox jumo over the lazy dog Thats the quick brown fox jumo over the lazy dog Thats the quick brown fox jumo over the lazy dog Thats the quick brown fox jumo over the lazy dog ',
                  style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /20),
                )
            ),
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(border: Border.all(color:
                    Colors.deepOrange,width: _mediaQuery.size.width * MaxWidth /200
                    ),
                        borderRadius: BorderRadius.circular(_mediaQuery.size.width * MaxWidth /40
                        )
                    ),
                    height: _mediaQuery.size.width * MaxWidth /8,
                    margin: EdgeInsets.only(
                        top: _mediaQuery.size.height * MaxHieght /30,
                        left: _mediaQuery.size.width * MaxWidth /15
                    ),
                    child: TextButton(onPressed: (){}, child:
                    Text('Rs.3500/Person',style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /25),
                    )
                    )
                ),

                Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(color:
                        Colors.deepOrange,width: _mediaQuery.size.width * MaxWidth /200
                        ),
                        borderRadius: BorderRadius.circular(_mediaQuery.size.width * MaxWidth /40
                        )
                    ),
                    width: _mediaQuery.size.width * MaxWidth /2.7,
                    height: _mediaQuery.size.width * MaxWidth /8,
                    margin: EdgeInsets.only(
                        top: _mediaQuery.size.height * MaxHieght /30,
                        left: _mediaQuery.size.width * MaxWidth /9
                    ),
                    child: TextButton(onPressed: (){}, child:
                    Text('Book   Now',style: TextStyle(
                        color: Colors.white,fontSize: _mediaQuery.size.width * MaxWidth /22),
                    )
                    )
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
