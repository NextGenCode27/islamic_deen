import 'package:islamic_deen/features/namaz/domain/entity/namaz_entity.dart';

class NamazModel extends NamazEntity {
  NamazModel({
    required super.code,
    required super.status,
    required super.data,
  });

  factory NamazModel.fromJson(Map<String, dynamic> json) {
    return NamazModel(
      code: json['code'],
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  Timings? timings;
  Date? date;
  Meta? meta;

  Data({this.timings, this.date, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}

class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  Timings(
      {this.fajr,
      this.sunrise,
      this.dhuhr,
      this.asr,
      this.sunset,
      this.maghrib,
      this.isha,
      this.imsak,
      this.midnight,
      this.firstthird,
      this.lastthird});

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
    firstthird = json['Firstthird'];
    lastthird = json['Lastthird'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Fajr': fajr,
      'Sunrise': sunrise,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Sunset': sunset,
      'Maghrib': maghrib,
      'Isha': isha,
      'Imsak': imsak,
      'Midnight': midnight,
      'Firstthird': firstthird,
      'Lastthird': lastthird,
    };
  }
}

class Date {
  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  Date({this.readable, this.timestamp, this.hijri, this.gregorian});

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null
        ? Gregorian.fromJson(json['gregorian'])
        : null;
  }
}

class Hijri {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  List<Null>? holidays;

  Hijri(
      {this.date,
      this.format,
      this.day,
      this.weekday,
      this.month,
      this.year,
      this.designation,
      this.holidays});

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
        json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
    json['holidays'] != null;
  }
}

class Weekday {
  String? en;
  String? ar;

  Weekday({this.en, this.ar});

  Weekday.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }
}

class Month {
  int? number;
  String? en;
  String? ar;

  Month({this.number, this.en, this.ar});

  Month.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
  }
}

class Designation {
  String? abbreviated;
  String? expanded;

  Designation({this.abbreviated, this.expanded});

  Designation.fromJson(Map<String, dynamic> json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }
}

class Gregorian {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;

  Gregorian(
      {this.date,
      this.format,
      this.day,
      this.weekday,
      this.month,
      this.year,
      this.designation});

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
        json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
  }
}

class Meta {
  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Offset? offset;

  Meta(
      {this.latitude,
      this.longitude,
      this.timezone,
      this.method,
      this.latitudeAdjustmentMethod,
      this.midnightMode,
      this.school,
      this.offset});

  Meta.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method = json['method'] != null ? Method.fromJson(json['method']) : null;
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset = json['offset'] != null ? Offset.fromJson(json['offset']) : null;
  }
}

class Method {
  int? id;
  String? name;
  Params? params;
  Location? location;

  Method({this.id, this.name, this.params, this.location});

  Method.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    params = json['params'] != null ? Params.fromJson(json['params']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }
}

class Params {
  double? fajr;
  String? isha;

  Params({this.fajr, this.isha});

  Params.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    isha = json['Isha'];
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}

class Offset {
  int? imsak;
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? sunset;
  int? isha;
  int? midnight;

  Offset(
      {this.imsak,
      this.fajr,
      this.sunrise,
      this.dhuhr,
      this.asr,
      this.maghrib,
      this.sunset,
      this.isha,
      this.midnight});

  Offset.fromJson(Map<String, dynamic> json) {
    imsak = json['Imsak'];
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    sunset = json['Sunset'];
    isha = json['Isha'];
    midnight = json['Midnight'];
  }
}
