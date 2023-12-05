import 'package:lettutor/models/token/tokens.dart';
import 'package:lettutor/models/user.dart';

class Auth {
  User user;
  Tokens tokens;

  Auth({
    required this.user,
    required this.tokens,
  }); 
  
  Auth.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json['user']),
        tokens = Tokens.fromJson(json['tokens']);
}
