import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<SurahMetaData?> fetchData() async {
//   try {
//     final response = await http.get(Uri.parse('YOUR_API_ENDPOINT_HERE'));

//     if (response.statusCode == 200) {
//       return SurahMetaData.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load data');
//     }
//   } catch (e) {
//     print('Error fetching data: $e');
//     return null; // Return null or handle error according to your application's logic
//   }
// }

class SurahMetaDataModel {
  int? code;
  String? status;
  Data? data;

  SurahMetaDataModel({this.code, this.status, this.data});

  SurahMetaDataModel.fromJson(Map<String, dynamic> json) {
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
  Ayahs? ayahs;
  Surahs? surahs;
  Surahs? sajdas;
  Surahs? rukus;
  Surahs? pages;
  Surahs? manzils;
  Surahs? hizbQuarters;
  Surahs? juzs;

  Data(
      {this.ayahs,
      this.surahs,
      this.sajdas,
      this.rukus,
      this.pages,
      this.manzils,
      this.hizbQuarters,
      this.juzs});

  Data.fromJson(Map<String, dynamic> json) {
    ayahs = json['ayahs'] != null ? Ayahs.fromJson(json['ayahs']) : null;
    surahs = json['surahs'] != null ? Surahs.fromJson(json['surahs']) : null;
    sajdas = json['sajdas'] != null ? Surahs.fromJson(json['sajdas']) : null;
    rukus = json['rukus'] != null ? Surahs.fromJson(json['rukus']) : null;
    pages = json['pages'] != null ? Surahs.fromJson(json['pages']) : null;
    manzils = json['manzils'] != null ? Surahs.fromJson(json['manzils']) : null;
    hizbQuarters = json['hizbQuarters'] != null
        ? Surahs.fromJson(json['hizbQuarters'])
        : null;
    juzs = json['juzs'] != null ? Surahs.fromJson(json['juzs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ayahs != null) {
      data['ayahs'] = ayahs!.toJson();
    }
    if (surahs != null) {
      data['surahs'] = surahs!.toJson();
    }
    if (sajdas != null) {
      data['sajdas'] = sajdas!.toJson();
    }
    if (rukus != null) {
      data['rukus'] = rukus!.toJson();
    }
    if (pages != null) {
      data['pages'] = pages!.toJson();
    }
    if (manzils != null) {
      data['manzils'] = manzils!.toJson();
    }
    if (hizbQuarters != null) {
      data['hizbQuarters'] = hizbQuarters!.toJson();
    }
    if (juzs != null) {
      data['juzs'] = juzs!.toJson();
    }
    return data;
  }
}

class Ayahs {
  int? count;

  Ayahs({this.count});

  Ayahs.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    return data;
  }
}

class Surahs {
  int? count;
  List<References>? references;

  Surahs({this.count, this.references});

  Surahs.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['references'] != null) {
      references = <References>[];
      json['references'].forEach((v) {
        references!.add(References.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (references != null) {
      data['references'] = references!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class References {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  References(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.revelationType});

  References.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['englishName'] = englishName;
    data['englishNameTranslation'] = englishNameTranslation;
    data['numberOfAyahs'] = numberOfAyahs;
    data['revelationType'] = revelationType;
    return data;
  }
}

class ReferencesMini {
  int? surah;
  int? ayah;
  bool? recommended;
  bool? obligatory;

  ReferencesMini({this.surah, this.ayah, this.recommended, this.obligatory});

  ReferencesMini.fromJson(Map<String, dynamic> json) {
    surah = json['surah'];
    ayah = json['ayah'];
    recommended = json['recommended'];
    obligatory = json['obligatory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['surah'] = surah;
    data['ayah'] = ayah;
    data['recommended'] = recommended;
    data['obligatory'] = obligatory;
    return data;
  }
}

class ReferencesMini2 {
  int? surah;
  int? ayah;

  ReferencesMini2({this.surah, this.ayah});

  ReferencesMini2.fromJson(Map<String, dynamic> json) {
    surah = json['surah'];
    ayah = json['ayah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['surah'] = surah;
    data['ayah'] = ayah;
    return data;
  }
}

Future<SurahMetaDataModel?> fetchSurahMetaData() async {
  try {
    final response =
        await http.get(Uri.parse('http://api.alquran.cloud/v1/meta'));

    print(response.body);
    if (response.statusCode == 200) {
      return SurahMetaDataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error fetching data: $e');
    return null; // Return null or handle error according to your application's logic
  }
}
