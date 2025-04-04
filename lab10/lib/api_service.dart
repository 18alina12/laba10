import 'package:dio/dio.dart';
import 'rest_client.dart';
import 'user.dart';

class ApiService {
  final RestClient client;

  ApiService()
      : client = RestClient(Dio(BaseOptions(contentType: "application/json")));

  Future<List<User>> getData() async {
    print("Fetching from API...");
    try {
      final users = await client.getUsers();
      print("Fetched ${users.length} users");
      return users;
    } catch (e) {
      print("Error fetching data: $e");
      return [];
    }
  }
}
