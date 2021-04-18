import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:flutter/material.dart';

class UserNameChange extends StatelessWidget {
  const UserNameChange({
    Key key,
    @required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Имя',
            style: FontStyles.regularStyle(
              fontSize: 14,
              fontFamily: 'Montserrat',
              color: Color(0xff232323),
            ),
          ),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15.0),
              hintText: 'Введите ваше имя',
              hintStyle: FontStyles.regularStyle(
                  fontSize: 17, fontFamily: 'Ubuntu', color: Color(0xff232323)),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
