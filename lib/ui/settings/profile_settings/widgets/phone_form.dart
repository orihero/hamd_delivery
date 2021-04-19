import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/masks/masks.dart';
import 'package:flutter/material.dart';

class UserPhonForm extends StatelessWidget {
  const UserPhonForm({
    Key key,
    @required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 55.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.phone_android,
              color: Colors.grey,
            ),
          ),
          Flexible(
            child: TextFormField(
              controller: phoneController,
              inputFormatters: [InputMask.maskPhoneNumber],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15.0),
                hintText: 'Введите свой номер телефона',
                hintStyle: FontStyles.regularStyle(
                    fontSize: 12,
                    fontFamily: 'Ubuntu',
                    color: Color(0xff9E9E9E)),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
