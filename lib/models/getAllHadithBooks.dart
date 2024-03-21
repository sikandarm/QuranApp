//https://www.hadithapi.com/api/books?

import 'package:http/http.dart' as http;

import 'dart:convert';

class HadithBooksDataModel {
  int? status;
  String? message;
  List<Books>? books;

  HadithBooksDataModel({this.status, this.message, this.books});

  HadithBooksDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (books != null) {
      data['books'] = books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? id;
  String? bookName;
  String? writerName;
  String? aboutWriter;
  String? writerDeath;
  String? bookSlug;
  String? hadithsCount;
  String? chaptersCount;

  Books(
      {this.id,
      this.bookName,
      this.writerName,
      this.aboutWriter,
      this.writerDeath,
      this.bookSlug,
      this.hadithsCount,
      this.chaptersCount});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookName = json['bookName'];
    writerName = json['writerName'];
    aboutWriter = json['aboutWriter'];
    writerDeath = json['writerDeath'];
    bookSlug = json['bookSlug'];
    hadithsCount = json['hadiths_count'];
    chaptersCount = json['chapters_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bookName'] = bookName;
    data['writerName'] = writerName;
    data['aboutWriter'] = aboutWriter;
    data['writerDeath'] = writerDeath;
    data['bookSlug'] = bookSlug;
    data['hadiths_count'] = hadithsCount;
    data['chapters_count'] = chaptersCount;
    return data;
  }
}

Future<HadithBooksDataModel> fetchAllHadithBooks() async {
  try {
    final response = await http.get(Uri.parse(
        'https://www.hadithapi.com/api/books?apiKey=\$2y\$10\$ahiUfL7OEVUJoaSD9ZlvfuqdaRUKSMwv4Vlnc0LZ1gB9LormatB76'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return HadithBooksDataModel.fromJson(jsonDecode(response.body));
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
