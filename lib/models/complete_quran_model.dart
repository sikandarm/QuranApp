// To parse this JSON data, do
//
//     final quranCompleteModel = quranCompleteModelFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

QuranCompleteModel quranCompleteModelFromJson(String str) =>
    QuranCompleteModel.fromJson(json.decode(str));

String quranCompleteModelToJson(QuranCompleteModel data) =>
    json.encode(data.toJson());

class QuranCompleteModel {
  final int? code;
  final String? status;
  final Data? data;

  QuranCompleteModel({
    this.code,
    this.status,
    this.data,
  });

  factory QuranCompleteModel.fromJson(Map<String, dynamic> json) =>
      QuranCompleteModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Surah>? surahs;
  final Edition? edition;

  Data({
    this.surahs,
    this.edition,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        surahs: json["surahs"] == null
            ? []
            : List<Surah>.from(json["surahs"]!.map((x) => Surah.fromJson(x))),
        edition:
            json["edition"] == null ? null : Edition.fromJson(json["edition"]),
      );

  Map<String, dynamic> toJson() => {
        "surahs": surahs == null
            ? []
            : List<dynamic>.from(surahs!.map((x) => x.toJson())),
        "edition": edition?.toJson(),
      };
}

class Edition {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"],
        language: json["language"],
        name: json["name"],
        englishName: json["englishName"],
        format: json["format"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "language": language,
        "name": name,
        "englishName": englishName,
        "format": format,
        "type": type,
      };
}

class Surah {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final RevelationType? revelationType;
  final List<Ayah>? ayahs;

  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: revelationTypeValues.map[json["revelationType"]]!,
        ayahs: json["ayahs"] == null
            ? []
            : List<Ayah>.from(json["ayahs"]!.map((x) => Ayah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationTypeValues.reverse[revelationType],
        "ayahs": ayahs == null
            ? []
            : List<dynamic>.from(ayahs!.map((x) => x.toJson())),
      };
}

class Ayah {
  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final dynamic sajda;

  Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
      };
}

class SajdaClass {
  final int? id;
  final bool? recommended;
  final bool? obligatory;

  SajdaClass({
    this.id,
    this.recommended,
    this.obligatory,
  });

  factory SajdaClass.fromJson(Map<String, dynamic> json) => SajdaClass(
        id: json["id"],
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recommended": recommended,
        "obligatory": obligatory,
      };
}

enum RevelationType { MECCAN, MEDINAN }

final revelationTypeValues = EnumValues(
    {"Meccan": RevelationType.MECCAN, "Medinan": RevelationType.MEDINAN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

Future<QuranCompleteModel> fetchQuranComplete() async {
  final response =
      await http.get(Uri.parse('https://api.alquran.cloud/v1/quran/ar.asad'));

  if (response.statusCode == 200) {
    return QuranCompleteModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load QuranCompleteModel');
  }
}
