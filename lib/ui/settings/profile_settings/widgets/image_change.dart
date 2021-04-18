import 'dart:io';

import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImageChange extends StatefulWidget {
  UserImageChange({
    Key key,
    @required File userImage,
    @required this.userController,
  })  : _userImage = userImage,
        super(key: key);

  File _userImage;
  final UserProfileController userController;

  @override
  _UserImageChangeState createState() => _UserImageChangeState();
}

class _UserImageChangeState extends State<UserImageChange> {
  final userImagePicker = ImagePicker();
  Future getUserImage() async {
    final pickedUserImage =
        await userImagePicker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedUserImage != null) {
          widget._userImage = File(pickedUserImage.path);
        } else {
          print('No Image Selected');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => getUserImage(),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              height: 95,
              width: 95,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: widget._userImage == null
                  ? CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'http://hamd.loko.uz/' +
                            widget.userController.profileList.first.photo,
                      ),
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(widget._userImage),
                    ),
            ),
            Positioned(
              right: 25,
              bottom: -10,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.add,
                  color: Color(0xff575F6B),
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
