import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/keys.dart';

class SearchTextInQuranModel {
  int? code;
  String? status;
  Data? data;

  SearchTextInQuranModel({this.code, this.status, this.data});

  SearchTextInQuranModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? count;
  List<Matches>? matches;

  Data({this.count, this.matches});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  int? number;
  String? text;
  Edition? edition;
  Surah? surah;
  int? numberInSurah;

  Matches(
      {this.number, this.text, this.edition, this.surah, this.numberInSurah});

  Matches.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    edition =
        json['edition'] != null ? Edition.fromJson(json['edition']) : null;
    surah = json['surah'] != null ? Surah.fromJson(json['surah']) : null;
    numberInSurah = json['numberInSurah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['text'] = text;
    if (edition != null) {
      data['edition'] = edition!.toJson();
    }
    if (surah != null) {
      data['surah'] = surah!.toJson();
    }
    data['numberInSurah'] = numberInSurah;
    return data;
  }
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? type;

  Edition(
      {this.identifier, this.language, this.name, this.englishName, this.type});

  Edition.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['language'] = language;
    data['name'] = name;
    data['englishName'] = englishName;
    data['type'] = type;
    return data;
  }
}

class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;

  Surah(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType});

  Surah.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['englishName'] = englishName;
    data['englishNameTranslation'] = englishNameTranslation;
    data['revelationType'] = revelationType;
    return data;
  }
}

Future<SearchTextInQuranModel> fetchAllTextInQuran(
    {required String textToSearch, required String language}) async {
  try {
    final response = await http.get(Uri.parse(
        Keys.getAllTextInQuranEndPonit + textToSearch + '/all/$language'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return SearchTextInQuranModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load Quran editions');
    }
  } catch (e) {
    // Handle any errors that occur during the HTTP request.
    print('Error fetching Quran editions: $e');
    throw Exception('Failed to load Quran editions');
  }
}
