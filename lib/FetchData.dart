import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchData {
  String apiURL =
      'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json';
  Future getData() async {
    var response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // print(response.statusCode);
      //  var p = data.exercises[0].id;
      // print(data['exercises'][0]['id']);
      return data;
    }
  }

  reciveData() async {
    var newData = await getData();
//  print(newData);
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return FirstScreen(
    //     data: newData,
    //   );
    // }));
  }
}
