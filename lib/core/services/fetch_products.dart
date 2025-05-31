import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchProducts(String category) async {
    try {
      final response =
          await _dio.get('https://dummyjson.com/products/category/$category');
      if (response.data != null && response.data['products'] != null) {
        return response.data['products'];
      } else {
        throw Exception('Products not found in the response');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      final response =
          await _dio.get('https://dummyjson.com/products/category-list');
      if (response.data != null && response.data is List) {
        return List<String>.from(response.data);
      } else {
        throw Exception('Categories not found in the response');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
