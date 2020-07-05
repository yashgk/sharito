import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:Scaffold(

          body: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(
    //                  height:MediaQuery.of(context).size.height ,
    //                  width: MediaQuery.of(context).size.width,
                        child: Text(
                        'S',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,fontSize: 200,fontWeight: FontWeight.bold ,height: 2),
              ),
                  ),
                ),
                  Flexible(
                    flex: 2,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
