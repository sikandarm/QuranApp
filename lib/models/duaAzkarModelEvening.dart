import 'dart:convert';

import 'package:flutter/services.dart';

class AzkarModelEvening {
  String? title;
  List<Content>? content;

  AzkarModelEvening({this.title, this.content});

  AzkarModelEvening.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? zekr;
  String? translation;
  int? repeat;
  String? bless;

  Content({this.zekr, this.translation, this.repeat, this.bless});

  Content.fromJson(Map<String, dynamic> json) {
    zekr = json['zekr'];
    translation = json['translation'];
    repeat = json['repeat'];
    bless = json['bless'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zekr'] = zekr;
    data['translation'] = translation;
    data['repeat'] = repeat;
    data['bless'] = bless;
    return data;
  }
}

Future<AzkarModelEvening> fetchAzkarDataEvening() async {
  // Load the JSON file from the assets using rootBundle
  String jsonString = await rootBundle.loadString('assets/evening_azkar.json');
  Map<String, dynamic> decodedJsonString = jsonDecode(jsonString);

  // Decode the JSON string into a list of Zekr objects
  AzkarModelEvening zekrList = AzkarModelEvening.fromJson(decodedJsonString);

  return zekrList;
}
