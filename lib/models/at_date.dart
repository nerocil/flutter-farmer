class AtDate {
  String? date;
  String? readable;
  String? time;
  String? second;
  String? dateTime;

  AtDate({this.date, this.readable, this.time, this.second, this.dateTime});

  AtDate.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    readable = json['readable'];
    time = json['time'];
    second = json['second'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['readable'] = readable;
    data['time'] = time;
    data['second'] = second;
    data['date_time'] = dateTime;
    return data;
  }
}