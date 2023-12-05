class AccessToken {
  String token;
  DateTime expires;

  AccessToken({
    required this.token,
    required this.expires,
  });

  AccessToken.fromJson(Map<String, dynamic> json)
      : token = json['token'] ?? '',
        expires = DateTime.parse(json['expires']);
}
