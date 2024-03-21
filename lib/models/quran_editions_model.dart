import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/keys.dart';

class QuranEditionsModel {
  int? code;
  String? status;
  List<Data>? data;

  QuranEditionsModel({this.code, this.status, this.data});

  QuranEditionsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  Data(
      {this.identifier,
      this.language,
      this.name,
      this.englishName,
      this.format,
      this.type,
      this.direction});

  Data.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['language'] = language;
    data['name'] = name;
    data['englishName'] = englishName;
    data['format'] = format;
    data['type'] = type;
    data['direction'] = direction;
    return data;
  }
}

// Future<QuranEditionsModel> fetchQuranEditions() async {
//   final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));

//   if (response.statusCode == 200) {
//     // If the server returns a 200 OK response, parse the JSON
//     return QuranEditionsModel.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response, throw an exception.
//     throw Exception('Failed to load Quran editions');
//   }
// }

Future<QuranEditionsModel> fetchQuranEditions() async {
  try {
    final response = await http.get(Uri.parse(Keys.quranEditionsEndPoint));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return QuranEditionsModel.fromJson(jsonDecode(response.body));
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
