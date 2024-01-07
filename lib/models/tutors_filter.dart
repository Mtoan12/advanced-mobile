class TutorsFilter {
  String specialty = '';
  String search;
  String page;
  String perPage;
  bool isLiked;

  TutorsFilter(
      {this.specialty = '',
      this.search = '',
      this.page = '1',
      this.perPage = '12',
      this.isLiked = false});
}
