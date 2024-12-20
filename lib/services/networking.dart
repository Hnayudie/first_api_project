import 'package:dio/dio.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  final dio = Dio();

  Future<dynamic> getData() async {
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
