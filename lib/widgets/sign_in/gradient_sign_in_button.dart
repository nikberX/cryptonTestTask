import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  //screen height and width
  final double height;
  final double width;

  final Function onTap;
  final bool isActive;

  SignInButton({required this.height,required this.width,required this.onTap,required this.isActive});
  
  @override
  Widget build(BuildContext context) {
    return DecoratedBox( //custom button to sign in (gradient)
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: isActive 
          ? [
            Color(0xFFE74249),
            Color(0xFFBB4E75)
          ]
          : [
            Colors.grey,
            Colors.grey
          ]
        )
      ),
      child: SizedBox( 
         width: width * 0.74444,
         height: height * 0.081538,
         //Log in
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent)
            ),
            onPressed: isActive ? () {onTap(context);} : null,
            child: Center(
              child: Text(//button label
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
    );
  }
}