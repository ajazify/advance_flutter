import 'package:hive_flutter/hive_flutter.dart';

class TodoController {
  //TODO :4 Read, Write, Delete

  // Reference to the Hive box
  final Box _box = Hive.box('mybox');

  // Write data to Hive
  void writeData(
      {required String name,
      required String email,
      required String phone,
      required String website,
      required String username}) {
    var userMap = {"name": name, "username": username, "email": email, "phone": phone, "website": website};
    _box.put('userdetails', userMap);
  }

  // Read data from Hive
  dynamic readData() {
    var userDetails = _box.get('userdetails');
    if (userDetails == null || userDetails.isEmpty) {
      return ('Nothing to fetch');
    } else {
      return userDetails;
    }
  }

  // Delete data from Hive
  void deleteData() {
    _box.delete('userdetails');
  }
}
