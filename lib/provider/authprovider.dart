import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void Login(String email, String pass) async {
    setloading(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': pass,
      });
      if (response.statusCode == 200) {
        print('Successfully');
        setloading(false);
      } else {
        print('Failed');
        setloading(false);
      }
    } catch (e) {
      setloading(false);
      print(e.toString());
    }
  }
}
