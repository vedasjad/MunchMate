import 'package:flutter/material.dart';

import '../models/user.dart';

class LocalUserProvider extends ChangeNotifier {
  late LocalUser _localUser;
  void addLocalUser(LocalUser localUser) {
    _localUser = localUser;
  }

  get localUser => _localUser;
}
