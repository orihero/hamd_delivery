import 'package:get/get.dart';
import 'package:HAMD_Delivery/models/my_profiel_model.dart';
import 'package:HAMD_Delivery/services/my_profile.dart';

class MyProfileController extends GetxController {
  var profileList = List<Data>().obs;
  var isLoading = true.obs;

  void fetchMyProfileData() async {
    print('fetching my profile user data');
    try {
      isLoading(true);
      var profile = await MyProfile.fetchMyProfile();

      if (profile != null) {
        profileList.clear();
        profileList.add(profile.data);
        print(profile);
      }
    } finally {
      isLoading(false);
    }
  }
}
