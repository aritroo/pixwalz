import 'package:http/http.dart' as http;

class ApiController {
  getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "gTq0yXfUcvMBmANNS1bwyuWU6xdFXjWyrlApEHTPwdxk6kZqoxHYTVad"
    }).then(
      (value) => print(value.body),
    );
  }
}
