class TutorsFilter {
  String specialty = '';
  String search;
  String page;
  String perPage;

  TutorsFilter(
      {this.specialty = '',
      this.search = '',
      this.page = '1',
      this.perPage = '12'});
}
