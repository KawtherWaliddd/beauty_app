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

  
}
