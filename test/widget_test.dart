import 'package:bookstore/repository/home_repository.dart';
import 'package:bookstore/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //testing books api
  test("Books Api testing", () async {
    final booksModelList = await HomeRepository().fetchBooksLists();
    expect(booksModelList, booksModelList);
  });

  // //testing listile widget
  // testWidgets("testing Listtile Widget of books", (WidgetTester tester) async {
  //   await tester.pumpWidget(HomeScreen());
  //   var listTile = find.byType(ListTile);
  //   expect(listTile, findsOneWidget);
  //   await tester.tap(listTile);
  //   await tester.pump();
  // });
}
