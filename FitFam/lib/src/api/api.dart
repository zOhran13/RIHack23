import 'package:http/http.dart' as http;

void fetchAlbum() async {
  var url = Uri.parse('http://192.168.102.234:2539/events'); 
  var response = await http.get(url);

  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
    // Handle the data here
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}