import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dataclass.dart';

class Service {
  Future<List<cData>> getAllData() async {
    final response = await http.get(
        Uri.parse('https://6283762138279cef71d77f41.mockapi.io/api/v1/Data'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      //mapping data json biar rapi
      return jsonResponse.map((data) => cData.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
