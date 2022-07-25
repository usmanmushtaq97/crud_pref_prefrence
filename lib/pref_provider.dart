import 'package:crud_chared_prefrence/pref_repositrory.dart';
import 'package:crud_chared_prefrence/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'local_cache/preference_utils.dart';

class PrefProvider with ChangeNotifier {
  Future<void> saveUserList(UserDetailsModel userDetailsModel) async {
    try {
      final String userDataList = UserDetailsModel.encode([userDetailsModel]);
      print(userDataList.toString());
      if(userDataList.isNotEmpty){
        await PreferenceUtils.setString("getUserList", userDataList);
      }
    } catch (e) {
      debugPrint("onError: $e");
    }
    notifyListeners();
  }
  Future<List<UserDetailsModel>> getStoredUserList() async {
    List<UserDetailsModel> list =
    await PrefRepository.prefRepositoryInstance.getPrefSharedUserList();
    return list;
  }
}
