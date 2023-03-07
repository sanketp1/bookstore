import 'package:bookstore/model/book_model.dart';
import 'package:bookstore/res/components/elevatedRoundedRectangle.dart';
import 'package:bookstore/utils/utils.dart';
import 'package:bookstore/view/book_info_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchBooksListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("BookStore"),
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          switch (value.booksList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.booksList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.booksList.data!.length,
                  itemBuilder: (context, index) {
                    BookModel book = value.booksList.data![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      child: ElevatedRoundedRectangle(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(                
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookInfoScreen(
                                      bookModel: book,
                                    ),
                                  ));
                            },
                            leading: Hero(
                              tag: book.title!,
                              child: book.thumbnailUrl != null
                                  ? CachedNetworkImage(
                                      cacheKey: book.isbn,
                                      imageUrl: book.thumbnailUrl!,
                                      placeholder: (context, url) {
                                        return Icon(Icons.book);
                                      },
                                      errorWidget: (context, url, error) {
                                        return Icon(Icons.book);
                                      },
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider),
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ));
                                      },
                                    )
                                  : Icon(Icons.book),
                            ),
                            title: Text(book.title!),
                          ),
                        ),
                      ),
                    );
                  });

            default:
              return Container();
          }
        }),
      ),
    );
  }
}
