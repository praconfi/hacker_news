import 'package:dio/dio.dart';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  // 기본 설정
  Dio _dio() {
    return Dio(BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
    )
    );
  }

  // GET
  Future get(String subUrl) async {
    Response response = await _dio().get(url + subUrl);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }

  // POST with data
  Future post(String subUrl, Map<String, dynamic> data) async {
    Response response = await _dio().post(url + subUrl, data: data);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }

  // POST with formdata
  Future postForm(String subUrl, FormData formData) async {
    Response response = await _dio().post(url + subUrl, data: formData);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }

  // PATCH
  Future patch(String subUrl, Map<String, dynamic> data) async {
    Response response = await _dio().patch(url + subUrl, data: data);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }

  // DELETE
  Future delete(String subUrl, Map<String, dynamic> data) async {
    Response response = await _dio().delete(url + subUrl, data: data);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }
}