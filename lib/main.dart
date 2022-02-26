import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'insta.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LO_VE SKY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Insta> InstaList = [
    Insta(imguser: 'assets/images/camera_with_sky.jpg', img: 'assets/images/sky moring.jpg',
        userpost: 'LO_VE SKY',
        comments: [Comments(user: 'I_D_K', comment: "️❤️"),
          Comments(user: 'YU', comment: "Hello morning"),],
        caption: "SKY_MORNING ^^"),
    Insta(imguser: 'assets/images/camera_with_sky.jpg', img: 'assets/images/sky afternoon.jpg',
        userpost: 'LO_VE SKY',
        comments: [Comments(user: 'Gae_m', comment: '💕'),
          Comments(user: 'Luna', comment: '😎'),
          Comments(user: 'ja_mine', comment: '💚love'),],
        caption: 'SKY_AFTERNOON :)'),
    Insta(imguser: 'assets/images/camera_with_sky.jpg', img: 'assets/images/sky in the night.jpg',
        userpost: 'LO_VE SKY',
        comments: [Comments(user: 'YUI', comment: '😴'),
          Comments(user: 'YU', comment: 'Sweet Dream')],
        caption: 'GOOD_NIGHT'),
    Insta(imguser: 'assets/images/camera_with_sky.jpg', img: 'assets/images/read a book with rain.jpg',
        userpost: 'LO_VE SKY',
        comments:[Comments(user: 'ja_mine', comment: '🌧️'),
            Comments(user: 'Gae_m', comment: '📖☕🌧️')],
         caption: 'READING📖'),
    Insta(imguser: 'assets/images/camera_with_sky.jpg', img: 'assets/images/sky and rainbow.jpg',
        userpost: 'LO_VE SKY',
        comments:[Comments(user: 'YUI', comment: 'rainbow^^'),
          Comments(user: 'Gae_m', comment: ':)')],
        caption: '<RAINBOW🌈>'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(title: Text('SKY WITH EVERYDAY',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: InstaList.length,
          itemBuilder: (context, index) =>
              MyCard(insta: InstaList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final Insta insta;

  const MyCard({
    Key? key,
    required this.insta,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.insta.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.insta.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.insta.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.insta.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.insta.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text(
                        '${widget.insta.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade300,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        '${widget.insta.comments[i].comment}',
                        style: TextStyle(

                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),


          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){

                    setState(() {
                      widget.insta.comments.add(Comments(user: 'Flutter', comment: value));
                      controller.clear();

                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}