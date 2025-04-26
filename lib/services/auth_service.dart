class AuthService {
  static final users = <String, String>{}; // email: password

  static Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return users[email] == password;
  }

  static Future<bool> register(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (users.containsKey(email)) return false;
    users[email] = password;
    return true;
  }
}
