class Apis {
  static String baseUrl = "https://sandbox.api.lettutor.com/";

  static String login = "${baseUrl}auth/login";
  static String register = "${baseUrl}auth/register";
  static String searchTutor = "${baseUrl}tutor/search";
  static String learnTopic = "${baseUrl}learn-topic";
  static String testPreparation = "${baseUrl}test-preparation";

  static getTutorDetail(String id) {
    return "${baseUrl}tutor/$id";
  }
}
