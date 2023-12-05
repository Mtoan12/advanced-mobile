import 'package:lettutor/models/token/access_token.dart';
import 'package:lettutor/models/token/refresh_token.dart';

class Tokens {
  AccessToken access;
  RefreshToken refresh;

  Tokens({
    required this.access,
    required this.refresh,
  });

  Tokens.fromJson(Map<String, dynamic> json)
      : access = AccessToken.fromJson(json['access']),
        refresh = RefreshToken.fromJson(json['refresh']);
}
