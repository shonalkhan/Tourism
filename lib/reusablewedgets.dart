import 'package:flutter/material.dart';
import 'detailscreen.dart';

class ReusablePlaces extends StatelessWidget {
  const ReusablePlaces(
      {
    super.key,
  }
  );

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    var MaxWidth = 1;
    var MaxHieght = 1;
    return Container(
      margin: EdgeInsets.only(left:_mediaQuery.size.width * MaxWidth /15,
          top: _mediaQuery.size.height * MaxHieght /30),
      // height: _mediaQuery.size.height * MaxHieght /12,
      width: _mediaQuery.size.width * MaxWidth /4,
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('images/Mountain.jpeg'),
            fit: BoxFit.cover,),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text('\n\nMountain' , style: TextStyle(
            backgroundColor: Colors.black38, color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: _mediaQuery.size.width * MaxWidth/25),
        ),
      ),
    );
  }
}


class ReusableCiities extends StatelessWidget {
  const ReusableCiities({
    super.key,
    required MediaQueryData mediaQuery,
    required this.MaxWidth,
    required this.MaxHieght,
  }) : _mediaQuery = mediaQuery;

  final MediaQueryData _mediaQuery;
  final int MaxWidth;
  final int MaxHieght;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreeen(),));
      },
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: _mediaQuery.size.width * MaxWidth / 15,
                    top: _mediaQuery.size.height * MaxHieght / 34),
                padding: EdgeInsets.only(
                  top: _mediaQuery.size.height * MaxHieght /5,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(_mediaQuery.size.width * MaxWidth / 30),
                        topRight:  Radius.circular(_mediaQuery.size.width * MaxWidth / 30)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('images/Islamabad.jpg'),
                        fit: BoxFit.cover)),
                width: _mediaQuery.size.width * MaxWidth /1.7,),
              Container(
                margin: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth / 15,),
                color: Colors.white,
                child: RichText(text: TextSpan(style: TextStyle(color: Colors.black87,fontSize: 12),
                    children: [
                      TextSpan(text: 'Islamabad' ,
                          style: TextStyle(
                              fontSize: _mediaQuery.size.width * MaxWidth /19,
                              fontWeight: FontWeight.w700)),
                      TextSpan(text: '\nFaisal Mosque',
                          style:
                          TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /26)),
                      TextSpan(text: '            Rs.8000 PD',
                          style:
                          TextStyle(
                              fontSize: _mediaQuery.size.width * MaxWidth /26
                          )
                      ),
                    ]
                )
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth / 1.9,
                top: _mediaQuery.size.height * MaxHieght / 24),
            child: IconButton(onPressed: (){}, icon:
            Icon(Icons.favorite_sharp,size: _mediaQuery.size.width * MaxWidth/15 , color: Colors.red,)),
          ),
          Container(
            margin: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth / 2.15,
                top:    _mediaQuery.size.height * MaxHieght / 4.45),
            child: TextButton.icon(onPressed: (){}, icon:
            Icon(Icons.star_rate,size: _mediaQuery.size.width * MaxWidth /18 ,color: Colors.yellow,),
                label: Text('4.9',style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /26))
            ),
          ),
        ],
      ),
    );
    // return Stack(
    //   children: [
    //     Container(
    //       margin: EdgeInsets.only(
    //           left: _mediaQuery.size.width * MaxWidth / 15,
    //           top: _mediaQuery.size.height * MaxHieght / 34),
    //       padding: EdgeInsets.only(
    //           top: _mediaQuery.size.height * MaxHieght /5,
    //           left: _mediaQuery.size.width * MaxWidth / 60),
    //       color: Colors.white,
    //       // height: _mediaQuery.size.height * MaxHieght/3.7,
    //       width: _mediaQuery.size.width * MaxWidth /1.7,
    //       child: RichText(text: TextSpan(style: TextStyle(color: Colors.black87,fontSize: 12),
    //           children: [
    //             TextSpan(text: 'Islamabad' ,
    //                 style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /19, fontWeight: FontWeight.w700)),
    //             TextSpan(text: '\nFaisal Mosque',
    //                 style:
    //             TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /26)),
    //             TextSpan(text: '         Rs.8000 PD',
    //                 style:
    //             TextStyle(
    //                 fontSize: _mediaQuery.size.width * MaxWidth /26
    //             )
    //             ),
    //           ]
    //       )
    //       ),
    //     ),
    //     Container(
    //       margin: EdgeInsets.only(
    //           left: _mediaQuery.size.width * MaxWidth / 15,
    //           top: _mediaQuery.size.height * MaxHieght / 34
    //       ),
    //       decoration: BoxDecoration(
    //           color: Colors.white,
    //           image: DecorationImage(
    //           image: AssetImage('images/Islamabad.jpg'),
    //           fit: BoxFit.cover)),
    //           height: _mediaQuery.size.height * MaxHieght/5,
    //           width:  _mediaQuery.size.width * MaxWidth /1.7,
    //           child: IconButton(onPressed: (){
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) =>
    //                     DetailScreeen()
    //             )
    //         );
    //       }, icon: Icon(Icons.keyboard_arrow_right,)),
    //     ),
    //     Container(
    //       margin: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth / 2,
    //       top: _mediaQuery.size.height * MaxHieght / 24),
    //       // height: _mediaQuery.size.height * MaxHieght / 15,
    //       // width: _mediaQuery.size.width * MaxWidth/15,
    //       child: IconButton(onPressed: (){}, icon:
    //       Icon(Icons.favorite,size: _mediaQuery.size.width * MaxWidth/15 , color: Colors.red,)),
    //     ),
    //     Container(
    //       margin: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth / 2.3,
    //       top:    _mediaQuery.size.height * MaxHieght / 4.5),
    //       child: TextButton.icon(onPressed: (){}, icon:
    //       Icon(Icons.star_rate,size: _mediaQuery.size.width * MaxWidth /18 ,color: Colors.yellow,),
    //        label: Text('4.9',style: TextStyle(fontSize: _mediaQuery.size.width * MaxWidth /26))
    //            ),
    //     ),
    //   ],
    // );
  }
}





class ResuableCategories extends StatelessWidget {
  const ResuableCategories({
    super.key,
    required MediaQueryData mediaQuery,
    required this.MaxWidth,
    required this.MaxHieght,
  }) : _mediaQuery = mediaQuery;

  final MediaQueryData _mediaQuery;
  final int MaxWidth;
  final int MaxHieght;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: _mediaQuery.size.height * MaxHieght / 7,
          width: _mediaQuery.size.width * MaxWidth / 5,
          color: Colors.transparent,
          margin: EdgeInsets.only(
              left: _mediaQuery.size.width * MaxWidth / 16,
              top: _mediaQuery.size.height * MaxHieght / 75),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/beach.jpeg'),
            radius: _mediaQuery.size.width * MaxWidth /12,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth / 15,),
          child: Text('Hotel',style: TextStyle(fontWeight: FontWeight.w700,
              fontSize: _mediaQuery.size.width * MaxWidth /22
          ),
          ),
        ),
      ],
    );
  }
}




class ReusableColumn extends StatelessWidget {
  const ReusableColumn({
    super.key,
    required MediaQueryData mediaQuery,
    required this.MaxWidth,
    required this.MaxHieght,
  }) : _mediaQuery = mediaQuery;

  final MediaQueryData _mediaQuery;
  final int MaxWidth;
  final int MaxHieght;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: _mediaQuery.size.height * MaxHieght / 7,
          width: _mediaQuery.size.width * MaxWidth / 5,
          color: Colors.transparent,
          margin: EdgeInsets.only(
              left: _mediaQuery.size.width * MaxWidth / 16,
              top: _mediaQuery.size.height * MaxHieght / 75),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/forest.jpeg'),
            radius: _mediaQuery.size.width * MaxWidth /12,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: _mediaQuery.size.width * MaxWidth / 15,),
          child: Text('Hotel',style: TextStyle(fontWeight: FontWeight.w700,
              fontSize: _mediaQuery.size.width * MaxWidth /22
          ),
          ),
        ),
      ],
    );
  }
}
