Map<String, String> headers({String? token}) {
  return {"Authorization": "Bearer $token", "Content-Type": "application/json"};
}
