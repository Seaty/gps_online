import 'package:gps_selling/services/fb_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void facebookCheck() async {
  try {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by the fault we request the email and the public profile
    AccessToken accessToken;
    if (result.status == LoginStatus.success) {
      // you are logged
      final fbdata = await FacebookAuth.instance
          .getUserData(fields: "name,email,picture.width(200),id");
      accessToken = result.accessToken;
      FbData userData = FbData.fromJson(fbdata);
      print("User ID : ${userData.id} , email : ${userData.email}");
    } else {
      accessToken = await FacebookAuth.instance.accessToken;
      print(accessToken.token);
      if (accessToken != null) {
        final fbdata = await FacebookAuth.instance.getUserData();
        FbData userData = FbData.fromJson(fbdata);
        print("User ID : ${userData.id} , email : ${userData.email}");
      }
    }
  } catch (e) {
    print(e);
  }
}
