//dart imports

//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//files

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget> [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFE74249),
                    Color(0xFFBB4E75)
                  ],
                  stops: [0,1],
               )
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height:  mediaQuery.size.height * 0.06307,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: SizedBox(
                            height: mediaQuery.size.height * 0.03384,
                            width: mediaQuery.size.width * 0.21388,
                            child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                            ),
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.11384
                    ),
                    Container(
                      height: mediaQuery.size.height * 0.57846,
                      width: mediaQuery.size.width * 0.91111,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                          topRight: Radius.circular(4),
                          bottomLeft: Radius.circular(4)
                        )
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 48,
                            left: 30,
                            right: 30,
                            bottom: 34
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Nickname',
                                  style: TextStyle(
                                    color: Color(0xFFCED0D5),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                              ),
                              Container(
                                height: mediaQuery.size.height * 0.041538,
                                child: TextField()
                              ),
                              SizedBox(
                                height: mediaQuery.size.height * 0.043076,
                              ),
                              Text('Password',
                                  style: TextStyle(
                                    color: Color(0xFFCED0D5),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                              ),
                              Container(
                                height: mediaQuery.size.height * 0.041538,
                                child: TextField(obscureText: true,)
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.067692,),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(3)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFFE74249),
                                      Color(0xFFBB4E75)
                                    ],
                                    stops: [0,1],
                                  )
                                ),
                                child: InkWell(
                                  onTap: () {}, //Log in
                                  child: Container(
                                    width: mediaQuery.size.width * 0.74444,
                                    height: mediaQuery.size.height * 0.081538,
                                    
                                    child: Center(
                                      child: Text(
                                        'Sign in', 
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: mediaQuery.size.height * 0.046153),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Text('Регистрируясь вы принимаете наши условия:',
                                    style: TextStyle(
                                      color: Color(0xFF4D545C),
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                ),
                              ),
                              Text('политику использования данных', //wrap with InkWell(ontap: () => launch(url))
                                  style: TextStyle(                 //to create hyperlink
                                    color: Color(0xFF0290E0),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.underline
                                  ),
                              ),
                              Text('политику в отношении файлов cookie', //wrap with InkWell(ontap: () => launch(url))
                                  style: TextStyle(                 //to create hyperlink
                                    color: Color(0xFF0290E0),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.underline
                                  ),
                              ),
                             
                            ]
                          )
                        )
                      ),
                  ),
                  
            
                ],
          ),
              ),
            )
            
          ],
        ),
    );
  }
}