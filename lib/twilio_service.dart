//  import 'package:http/http.dart' as http;

//   Future<void> sendSMS() async {
//     final accountSid = 'ACa424d064352b5fb6bafeb155a072cf0f';
//     final authToken = 'b0eb9cda369ae4240260a64157b9769f';
//     final twilioNumber = '+19893944672';
//     final toNumber = '+919361648407';
//     final message = 'lat lon';

//     final response = await http.post(
//       Uri.parse('https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json'),
//       headers: {
//         'Authorization': 'Basic ' + base64Encode('$accountSid:$authToken'.codeUnits),
//         'Content-Type': 'application/x-www-form-urlencoded',
//       },
//       body: {
//         'From': twilioNumber,
//         'To': toNumber,
//         'Body': message,
//       },
//     );

//     if (response.statusCode == 201) {
//       print('SMS sent successfully!');
//     } else {
//       print('Failed to send SMS. Error: ${response.reasonPhrase}');
//     }
//   }
