import 'package:flutter/material.dart';
import 'package:mentalify/navbar.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    body:Column(
      children: [
        Padding(padding: const EdgeInsets.only(top:40,bottom: 40,right: 80,left: 80),
        child: Image.asset('assets/images/teamwork.png'),),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            "We are a team that believes that there is no shame in suffering from any kind of mental health problem or ask for any kind of help. We understand the importance of mental well being and hence we provide you best mental health experts along with some unique exercises to improve your mental health along with that we have a unique online test for you that tells you your mental health condition. ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 130,)),
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage('assets/images/instagram.png'),height: 20,width: 20,),
            Image(image: AssetImage('assets/images/facebook.png'),height: 20,width: 20,),
            Image(image: AssetImage('assets/images/twitter.png'),height: 20,width: 20,),
            Image(image: AssetImage('assets/images/linkedin.png'),width: 20,height: 20,),
            Image(image: AssetImage('assets/images/gmail.png'),height: 20,width: 20,),
          ],
        )

      ],
    ),
    );
  }
}
