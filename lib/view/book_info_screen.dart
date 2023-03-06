import 'dart:developer';

import 'package:bookstore/model/book_model.dart';
import 'package:bookstore/res/components/bookInformationBuilder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class BookInfoScreen extends StatelessWidget {
  BookModel? bookModel;
  BookInfoScreen({super.key, this.bookModel});

  String arrageListItemsToString(List data) {
    String items = "";
    for (String item in data) {
      items = "$item, " + items;
    }
    return items;
  }

  //method to format date
  String formatDate(String formattedString) {
    final date = DateTime.parse(formattedString);
    final formatted = DateFormat("yyyy/MM/dd").format(date);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    log(bookModel!.publishedDate!.date.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(bookModel!.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Hero(
                tag: bookModel!.title!,
                child: bookModel!.thumbnailUrl == null
                    ? Icon(
                        Icons.book,
                        size: 60,
                      )
                    : CachedNetworkImage(
                        cacheKey: bookModel!.isbn,
                        imageUrl: bookModel!.thumbnailUrl!,
                        placeholder: (context, url) {
                          return Icon(Icons.book);
                        },
                        errorWidget: (context, url, error) {
                          return Icon(Icons.book);
                        },
                        imageBuilder: (context, imageProvider) {
                          return Container(
                              decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider),
                            borderRadius: BorderRadius.circular(3),
                          ));
                        },
                      ),
              ),
            ),
            BookInformationBuilder(tag: "Title", data: bookModel!.title!),
            BookInformationBuilder(
                tag: "Author",
                data: bookModel!.authors != null
                    ? arrageListItemsToString(bookModel!.authors!)
                    : "No author mentioned"),
            BookInformationBuilder(
                tag: "Page Count",
                data: bookModel!.pageCount != null
                    ? bookModel!.pageCount!.toString()
                    : "Not available"),
            BookInformationBuilder(tag: "ISBN", data: bookModel!.isbn!),
            BookInformationBuilder(
                tag: "Published Date",
                data: bookModel!.publishedDate!.date != null
                    ? formatDate(bookModel!.publishedDate!.date.toString())
                    : "Not available"),
            BookInformationBuilder(tag: "Status", data: bookModel!.status!),
            BookInformationBuilder(
                tag: "Categories",
                data: bookModel!.categories!.isNotEmpty
                    ? arrageListItemsToString(bookModel!.categories!)
                    : "Not available"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Description: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Text(
                bookModel!.longDescription ?? "No description available",
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
