import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale('en', LocaleData.EN),
  MapLocale('vi', LocaleData.VI),
];

mixin LocaleData {
  static const String upcommingLesson = 'upcommingLesson';
  static const String loginTitle = 'loginTitle';
  static const String loginDescription = 'loginDescription';
  static const String emailLabel = 'emailLabel';
  static const String passwordLabel = 'passwordLabel';
  static const String forgotPassword = 'forgotPassword';
  static const String loginButton = 'loginButton';
  static const String continueLabel = 'continueLabel';
  static const String haveNoAccount = 'haveNoAccount';
  static const String signInLabel = 'SignInLabel';
  static const String timeLabel = 'timeLabel';
  static const String timeRemainingLabel = 'timeRemainingLabel';
  static const String enterLessonRoom = 'enterLessonRoom';
  static const String totalTimeLabel = 'totalTimeLabel';
  static const String findATutor = 'findATutor';
  static const String enterTutorName = 'enterTutorName';
  static const String selectTutorNationality = 'selectTutorNationality';
  static const String selectAvailableTutoringTime =
      'selectAvailableTutoringTime:';
  static const String selectADay = 'selectADay';
  static const String startTime = 'startTime';
  static const String endTime = 'endTime';
  static const String all = 'all';
  static const String englishForKids = 'englishForKids';
  static const String englishForBusiness = 'englishForBusiness';
  static const String conversational = 'conversational';
  static const String resetFilters = 'resetFilters';
  static const String recommendedTutors = 'recommendedTutors';
  static const String book = 'book';
  static const String schedule = 'schedule';
  static const String scheduleDescription1 = 'scheduleDescription1';
  static const String scheduleDescription2 = 'scheduleDescription2';
  static const String latestBook = 'latestBook';
  static const String lesson = 'lesson';
  static const String directMessage = 'directMessage';
  static const String cancel = 'cancel';
  static const String requestForLesson = 'requestForLesson';
  static const String editRequest = 'editRequest';
  static const String goToMeeting = 'goToMeeting';
  static const String history = 'history';
  static const String historyDesc1 = 'historyDesc1';
  static const String historyDesc2 = 'historyDesc2';
  static const String lessonTime = 'lessonTime';
  static const String noRequestForLesson = 'NoRequestForLesson';
  static const String tutorNotReview = 'tutorNotReview';
  static const String reviewFromTutor = 'reviewFromTutor';
  static const String addARating = 'addARating';
  static const String report = 'report';
  static const String edit = 'edit';
  static const String session = 'session';
  static const String discoverCourses = 'discoverCourses';
  static const String coursesDesc = 'coursesDesc';
  static const String course = 'course';
  static const String selectLevel = 'selectLevel';
  static const String selectCategory = 'selectCategory';
  static const String sortByLevel = 'sortByLevel';
  static const String discover = 'discover';
  static const String overview = 'overview';
  static const String whyTakeThisCourse = 'whyTakeThisCourse';
  static const String whatWillYouBeAbleToDo = 'whatWillYouBeAbleToDo';
  static const String experienceLevel = 'experienceLevel';
  static const String courseLength = 'courseLength';
  static const String topics = 'topics';
  static const String listTopics = 'listTopics';
  static const String likedTeachers = 'likedTeachers';
  static const String noTutorFound = 'noTutorFound';
  static const String found = 'found';
  static const String tutors = 'tutors';

  static const Map<String, String> EN = {
    loginTitle: "Say hello to your English tutors",
    loginDescription:
        "Become fluent faster through one on one video chat lessons tailored to your goals.",
    emailLabel: "EMAIL",
    passwordLabel: "PASSWORD",
    forgotPassword: "Forgot Password?",
    loginButton: "LOG IN",
    continueLabel: "Or continue with",
    haveNoAccount: "Not a member yet??",
    signInLabel: "Sign up",
    upcommingLesson: "Upcomming lesson",
    timeLabel: "Thu, 26 Oct 23 03:30 - 03:55",
    timeRemainingLabel: "starts in",
    enterLessonRoom: "Enter lesson room",
    totalTimeLabel: "Total lesson time is",
    findATutor: "Find a tutor",
    enterTutorName: "Enter tutor name...",
    selectTutorNationality: "Select tutor nationality",
    selectAvailableTutoringTime: "Select available tutoring time:",
    selectADay: "Select a day",
    startTime: "Start time",
    endTime: "End time",
    all: "All",
    englishForKids: "English for kids",
    englishForBusiness: "English for business",
    conversational: "Conversational",
    resetFilters: "Reset Filters",
    recommendedTutors: "Recommended Tutors",
    book: "Book",
    schedule: "Schedule",
    scheduleDescription1: "Here is a list of the sessions you have booked",
    scheduleDescription2:
        "You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours",
    latestBook: "Latest Book",
    lesson: "Lesson",
    directMessage: "Direct Message",
    cancel: "Cancel",
    requestForLesson: "Request for lesson",
    editRequest: "Edit Request",
    goToMeeting: "Go to meeting",
    history: "History",
    historyDesc1: "The following is a list of lessons you have attended",
    historyDesc2: "You can review the details of the lessons you have attended",
    lessonTime: "Lesson Time:",
    noRequestForLesson: "No request for lesson",
    tutorNotReview: "Tutor haven't reviewed yet",
    reviewFromTutor: "Review from tutor",
    addARating: "Add a Rating",
    report: "Report",
    edit: "Edit",
    session: "Session",
    discoverCourses: "Discover Courses",
    coursesDesc:
        "LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.",
    course: "Course",
    selectLevel: "Select level",
    selectCategory: "Select Category",
    sortByLevel: "Sort by level",
    discover: "Discover",
    overview: "Overview",
    whyTakeThisCourse: "Why take this course",
    whatWillYouBeAbleToDo: "What will you be able to do",
    experienceLevel: "Experience Level",
    courseLength: "Course Length",
    topics: "Topics",
    listTopics: "List Topics",
    likedTeachers: "Liked Teachers",
    noTutorFound: "No tutor found",
    found: 'We found',
    tutors: 'tutors for you',
  };

  static const Map<String, String> VI = {
    loginTitle: "Đăng nhập",
    loginDescription:
        "Phát triển kỹ năng tiếng Anh nhanh nhất bằng cách học 1 kèm 1 trực tuyến theo mục tiêu và lộ trình dành cho riêng bạn.",
    emailLabel: "ĐỊA CHỈ EMAIL",
    passwordLabel: "MẬT KHẨU",
    forgotPassword: "Quên mật khẩu?",
    loginButton: "ĐĂNG NHẬP",
    continueLabel: "Hoặc tiếp tục với",
    haveNoAccount: "Chưa có tài khoản?",
    signInLabel: "Đăng ký",
    upcommingLesson: "Buổi học sắp diễn ra",
    timeLabel: "T5, 26 Thg 10 23 03:30 - 03:55",
    timeRemainingLabel: "còn",
    enterLessonRoom: "Vào lớp học",
    totalTimeLabel: "Tổng số giờ bạn đã học là",
    findATutor: "Tìm kiếm gia sư",
    enterTutorName: "Nhập tên gia sư...",
    selectTutorNationality: "Chọn quốc tịch gia sư",
    selectAvailableTutoringTime: "Chọn thời gian dạy kèm có lịch trống:",
    selectADay: "Chọn một ngày",
    startTime: "Giờ bắt đầu",
    endTime: "Giờ kết thúc",
    all: "Tất cả",
    englishForKids: "Tiếng Anh cho trẻ em",
    englishForBusiness: "Tiếng Anh cho công việc",
    conversational: "Giao tiếp",
    resetFilters: "Đặt lại bộ tìm kiếm",
    recommendedTutors: "Gia sư được đề xuất",
    book: "Đặt lịch",
    schedule: "Lịch đã đặt",
    scheduleDescription1: "Đây là danh sách những khung giờ bạn đã đặt",
    scheduleDescription2:
        "Bạn có thể theo dõi khi nào buổi học bắt đầu, tham gia buổi học bằng một cú nhấp chuột hoặc có thể hủy buổi học trước 2 tiếng.",
    latestBook: "Latest Book",
    lesson: "buổi học",
    directMessage: "Nhắn tin",
    cancel: "Hủy",
    requestForLesson: "Yêu cầu cho buổi học",
    editRequest: "Chỉnh sửa yêu cầu",
    goToMeeting: "Vào buổi học",
    history: "Lịch sử các buổi học",
    historyDesc1: "Đây là danh sách các bài học bạn đã tham gia",
    historyDesc2:
        "Bạn có thể xem lại thông tin chi tiết về các buổi học đã tham gia đã tham gia",
    lessonTime: "Thời gian bài học:",
    noRequestForLesson: "Không có yêu cầu cho buổi học",
    tutorNotReview: "Gia sư chưa có đánh giá",
    reviewFromTutor: "Đánh giá từ gia sư",
    addARating: "Đánh giá",
    report: "Báo cáo",
    edit: "Sửa",
    session: "Buổi",
    discoverCourses: "Khám phá các khóa học",
    coursesDesc:
        "LiveTutor đã xây dựng nên các khóa học của các lĩnh vực trong cuộc sống chất lượng, bài bản và khoa học nhất cho những người đang có nhu cầu trau dồi thêm kiến thức về các lĩnh vực.",
    course: "Khóa học",
    selectLevel: "Chọn cấp độ",
    selectCategory: "Chọn danh mục",
    sortByLevel: "Sắp xếp theo độ khó",
    discover: "Khám phá",
    overview: "Tổng quan",
    whyTakeThisCourse: "Tại sao bạn nên học khóa học này",
    whatWillYouBeAbleToDo: "Bạn có thể làm gì",
    experienceLevel: "Trình độ yêu cầu",
    courseLength: "Thời lượng khóa học",
    topics: "Chủ đề",
    listTopics: "Danh sách chủ đề",
    likedTeachers: "Danh sách giáo viên yêu thích",
    noTutorFound: "Không tìm thấy giáo viên nào",
    found: 'Tìm thấy',
    tutors: 'giáo viên cho bạn',
  };
}
