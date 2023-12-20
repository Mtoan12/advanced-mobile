class TotalTime {
  int total;

  TotalTime({this.total = 0});

  TotalTime.fromJson(Map<String, dynamic> json) : total = json['total'] ?? 0;
}
