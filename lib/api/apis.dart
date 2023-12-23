class Apis {
  static String baseUrl = "https://sandbox.api.lettutor.com/";

  static String login = "${baseUrl}auth/login";
  static String register = "${baseUrl}auth/register";
  static String forgot = "${baseUrl}user/forgotPassword";
  static String searchTutor = "${baseUrl}tutor/search";
  static String learnTopic = "${baseUrl}learn-topic";
  static String testPreparation = "${baseUrl}test-preparation";
  static String totalTime = '${baseUrl}call/total';
  static String userInfo = '${baseUrl}user/info';
  static String manageFavoriteTutor = '${baseUrl}user/manageFavoriteTutor';
  static String report = '${baseUrl}report';
  static String booking = '${baseUrl}booking';
  static String uploadAvatar = '${baseUrl}user/uploadAvatar';
  static getTutorDetail(String id) {
    return "${baseUrl}tutor/$id";
  }

  static getTutorReviews(String id, int page, int perPage) {
    return "${baseUrl}feedback/v2/$id?page=$page&perPage=$perPage";
  }

  static getBookingList(
      {int page = 1,
      int perPage = 12,
      int inFuture = 1,
      String orderBy = 'meeting',
      String sortBy = 'asc'}) {
    return "${baseUrl}booking/list/student?page=$page&perPage=$perPage&inFuture=$inFuture&orderBy=$orderBy&sortBy=$sortBy";
  }

  static getCourseList({int page = 1, int size = 100}) {
    return "${baseUrl}course?page=$page&size=$size";
  }

  static getScheduleList(String tutorId) {
    return "${baseUrl}schedule?tutorId=$tutorId&page=0";
  }
}
