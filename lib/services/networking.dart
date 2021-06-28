import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final Uri url;

  Future getData() async {
    // get returns Future response

    //Response is a class which contains the data in its body property which API sent.
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data); //jsonDecode is of dynamic type
    } else {
      print(response.statusCode);
    }
  }
}
