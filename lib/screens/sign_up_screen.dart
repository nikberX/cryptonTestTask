//dart imports
import 'dart:core';
//packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//files
import '../widgets/sign_in/gradient_sign_in_button.dart';
import './main_screen.dart';
class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isSignInActive = false;
  //func to controll buttons active state
  void _inputChanged() {
    if (_loginController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        isSignInActive = false; 
      });
      return;
    };
    setState(() {

      isSignInActive = true;
    });
  }

  bool _validate() {
    if (_loginController.text.isEmpty || _passwordController.text.isEmpty) return false;
    
    RegExp loginValidation = RegExp(r"[^A-z_]", caseSensitive: false,); //finds all non-latin and non '_' symbols
                                                                        // if match - login denied
    
    var res = loginValidation.firstMatch(_loginController.text);

    if (res != null) {
      return false; 
    }

    bool passwordFailed = ((-1<_passwordController.text.indexOf(' '))||
                           (_passwordController.text.length < 3)||
                           (_passwordController.text.length > 9));
    if (passwordFailed) {
      return false;
    }

    return true;
  }

  void logIn(BuildContext context) {

    if (_validate()) {

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: 
      (_) {
        return MainScreen();
      }
      ));
    }
  }

  Widget _buildLoginLabel(MediaQueryData mediaQuery) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: SizedBox( //container for login label
            height: mediaQuery.size.height * 0.03384,
            width: mediaQuery.size.width * 0.21388,
            child: Text( //login label with style
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
      );
  }

  List<Widget> _buildEULA() {
    return [
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
          style: TextStyle(                      //to create hyperlink
            color: Color(0xFF0290E0),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.underline
          ),
        ),
    ];
  }

  List<Widget> _buildInputs(MediaQueryData mediaQuery){
    return [
      Text('Nickname',
          style: TextStyle(
            color: Color(0xFFCED0D5),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
      ),
      Container(//nickname input
        height: mediaQuery.size.height * 0.041538,
        child: TextField(
          onChanged: (_) => _inputChanged(),
          controller: _loginController,
        )
      ),
      SizedBox(//spacing between inputs
        height: mediaQuery.size.height * 0.043076,
      ),
      Text('Password', //label for password input
          style: TextStyle(
            color: Color(0xFFCED0D5),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
      ),
      Container( //password input
        height: mediaQuery.size.height * 0.041538,
        child: TextField(
          onChanged: (_) => _inputChanged(),
          obscureText: true,
          controller: _passwordController,
          
        )
      )
    ];
  }

  Widget _buildInputForm(MediaQueryData mediaQuery) {
    return Container( //Container for input form
      height: mediaQuery.size.height * 0.57846,
      width: mediaQuery.size.width * 0.91111,
      decoration: BoxDecoration( //decoration for container. Rounded corners
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(4)
        )
      ),
      child: SingleChildScrollView( //fixes keyboard overlapping
        child: Padding(//top spacing
          padding: EdgeInsets.only(
            top: 48,
            left: 30,
            right: 30,
            bottom: 34
          ),
          child: Column(//label for nickname input
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ..._buildInputs(mediaQuery),
              //spacing between button and input
              SizedBox(height: mediaQuery.size.height * 0.067692,),

              SignInButton(
                height: mediaQuery.size.height, 
                width: mediaQuery.size.width,
                onTap: logIn,
                isActive: isSignInActive,
              ),
              SizedBox(height: mediaQuery.size.height * 0.046153),
              ..._buildEULA()
              
            ]
          )
        )
      ),
    );
  }

  Widget _buildLayout(MediaQueryData mediaQuery) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox( //top spacing to lower 'Login' label
          height:  mediaQuery.size.height * 0.06307,
        ),
        _buildLoginLabel(mediaQuery),
        SizedBox( //spacing between login label and input form
          height: mediaQuery.size.height * 0.11384
        ),
        _buildInputForm(mediaQuery),
    ],
    );
  }

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
            Container( //gradient background
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
            SingleChildScrollView( //scroll if keyboard overlaps input fields
              child: Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                child: _buildLayout(mediaQuery),
              ),
            )
            
          ],
        ),
    );
  }
}