import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage('https://66.media.tumblr.com/63ca79cbcf24cfafd7942db137c8643a/tumblr_pi6oywteYH1s9y3qio2_500.png'),
              radius: 30.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.brown,
              ),
            )
          ],
        ),
        body: Center(
          child: FadeInImage(
            image: NetworkImage('https://images2.minutemediacdn.com/image/upload/c_crop,h_1475,w_2620,x_0,y_272/f_auto,q_auto,w_1100/v1554991977/shape/mentalfloss/71299-gettyimages-627159542.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200)
          ),
        ),
    );
  }
}