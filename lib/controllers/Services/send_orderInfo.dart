import 'dart:convert';
import 'package:http/http.dart' as http;

void send_mail(
    {String? email,
    String? address,
    String? location,
    String? contact,
    String? name,
    String? id,
    String? orderTime,
    String? selectedCheckBox,
    required String serviceDate,
    required String serviceTime}) async {
  var Service_id = "service_ijfg5hl",
      Template_id = "template_mi473bb",
      User_id = "lz942kHYEFSrTMBpf";
  var s = await http.post(
      Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {'origin': 'http:localhost', 'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': Service_id,
        'template_id': Template_id,
        'user_id': User_id,
        'template_params': {
          'name': 'Sircar',
          'message':
              "$email,$name,$id,$serviceDate,$serviceTime,$selectedCheckBox,$orderTime,$address,$location,$contact",
          'sender_email': 'pyushkumar166@gmail.com'
        }
      }));
}
