import 'package:bookstore/data/network/baseApiService.dart';
import 'package:bookstore/data/network/networkApiService.dart';
import 'package:bookstore/model/book_model.dart';
import 'package:bookstore/res/appUrl.dart';

class HomeRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<List<BookModel>> fetchBooksLists() async {
    List<BookModel> books = [];
    try {
      final response =
          await _apiService.getApiResponse(AppUrl.booksUrl) as List;
      books = response
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (err) {
      throw err;
    }

    return books;
  }
}
