

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<Map<String, dynamic>> fetchLatLngData() async {
//   const url = 'http://127.0.0.1:5000/latlong/a';
//   // final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     return data as Map<String, dynamic>;
//   } else {
//     throw Exception('Failed to retrieve lat and long. Status code: ${response.statusCode}');
//   }
// }