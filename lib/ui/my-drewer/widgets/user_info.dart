import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset('assets/images/user.png'),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Мирмахмудов Фарход',
                style: FontStyles.regularStyle(
                  fontSize: 15,
                  fontFamily: 'Ubuntu',
                  color: Color(0xff232323),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '+998 90 377 33 85',
                style: FontStyles.boldStyle(
                  fontSize: 15,
                  fontFamily: 'Ubuntu',
                  color: Color(0xff232323),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
