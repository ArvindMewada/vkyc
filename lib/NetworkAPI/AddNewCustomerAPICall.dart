import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


class NetworkCall{
  Future<dynamic> addNewCustomerApiCall() async {
    var requestdata = {
      "customerId": "Customer43215",
      "consent": "Y",
      "applicantFormData": {
        "applicationType": "GENERAL",
        "applicantType": "APPLICANT",
        "applicationId": "Cust1AppID1",
        "phone": "8818909210",
        "firstName": "UserNew",
        "fatherName": "Haribhai",
        "dob": "13/06/1994",
        "email": "arvind.m@karza.in",
        "gender": "male",
        "currentAddress": "address",
        "permanentAddress": "address",
        "middleName": "Haribhai",
        "lastName": "Ramanuj",
        "photo": "Photo"
      },
      "panData": {
        "name": "Krunal",
        "fatherName": "Dave",
        "dob": "13/06/1994",
        "panNo": "xxxxxxxxxxx"
      },
      "autoSchedule": false
    };
    Map data = {
      "Content-Type": "application/json",
      'karzatoken': 'sBqAhy05s3uH5t8z'
    };
    var body = json.encode(data);

    final response = await http.post(
      Uri.parse('https://app.karza.in/test/videokyc/api/customers'),
      headers: {"Content-Type": "application/json", "karzatoken": "sBqAhy05s3uH5t8z"},
      body: body,
    );

    final responseJson = jsonDecode(response.body);
    if(responseJson != null){

    }
    return responseJson;
  }
}