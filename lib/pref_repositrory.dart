import 'package:crud_chared_prefrence/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'local_cache/preference_utils.dart';

class PrefRepository {
  // Generate Instance
  static final PrefRepository _prefRepository = PrefRepository();
  // Get Instance of the class.
  static PrefRepository get prefRepositoryInstance => _prefRepository;
  Future<List<UserDetailsModel>> getPrefSharedUserList() async {
    try {
      final String? userDetailString = PreferenceUtils.getString("getUserList");
      final List<UserDetailsModel> userDetailList =
      UserDetailsModel.decode(userDetailString!);
      debugPrint("userDetailList:${userDetailList.map((e) => e)}");
      return userDetailList;
    } catch (e) {
      debugPrint("onError: $e");
      return [];
    }
  }
}
