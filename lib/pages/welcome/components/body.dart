import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ducafecat_news_getx/constant/color_constant.dart';
import 'package:flutter_ducafecat_news_getx/pages/login/login.dart';
import 'package:flutter_ducafecat_news_getx/pages/signup/sign_up.dart';
import 'package:flutter_ducafecat_news_getx/pages/welcome/components/background.dart';
import 'package:flutter_ducafecat_news_getx/pages/widgets/rounded_button.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("WELCOME",
              style: TextStyle(fontWeight:FontWeight.bold),),
              SizedBox(height: size.height*0.05,),
              SvgPicture.asset("assets/icons/chat.svg",height: size.height*0.45,),
              SizedBox(height: size.height*0.05,),
              RoundedButton(
                text: "SIGN IN",
                press: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return Login();
                    }
                  ));
                },
              ),
              RoundedButton(
                text:"SIGN UP",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press:(){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return SignUp();
                    }
                  ));
                },
              )
            ],
          ),
        )
    );
  }

}