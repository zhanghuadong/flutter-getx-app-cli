import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/constant/color_constant.dart';
import 'package:flutter_ducafecat_news_getx/pages/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(icon,color: kPrimaryColor,),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
