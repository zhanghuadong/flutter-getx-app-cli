import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ducafecat_news_getx/pages/login/components/background.dart';
import 'package:flutter_ducafecat_news_getx/pages/signup/sign_up.dart';
import 'package:flutter_ducafecat_news_getx/pages/widgets/account_check.dart';
import 'package:flutter_ducafecat_news_getx/pages/widgets/rounded_button.dart';
import 'package:flutter_ducafecat_news_getx/pages/widgets/rounded_input_field.dart';
import 'package:flutter_ducafecat_news_getx/pages/widgets/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AccountCheck(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUp();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
