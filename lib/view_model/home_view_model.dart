import 'package:bookstore/data/response/api_response.dart';
import 'package:bookstore/model/book_model.dart';
import 'package:bookstore/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomeViewViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();

  ApiResponse<List<BookModel>> booksList = ApiResponse.loading();

  setBooksList(ApiResponse<List<BookModel>> response) {
    booksList = response;



    
    notifyListeners();
  }

  Future<void> fetchBooksListApi() async {
    setBooksList(ApiResponse.loading());

    _homeRepo.fetchBooksLists().then((value) {
      setBooksList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setBooksList(ApiResponse.error(error.toString()));
    });
  }
}
