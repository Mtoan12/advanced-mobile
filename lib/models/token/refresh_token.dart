class RefreshToken {
  String token;
  DateTime expires;

  RefreshToken({
    required this.token,
    required this.expires,
  });

  RefreshToken.fromJson(Map<String, dynamic> json)
      : token = json['token'] ?? '',
        expires = DateTime.parse(json['expires']);
}
