import 'package:flutter/material.dart';
import 'package:news_flutter/models/article_model.dart';
import '../helper/news.dart';
import 'blog_tile.dart';
import 'navigation_drawer.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  const CategoryNews({super.key, required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var categoryName = widget.category;
    categoryName = categoryName.Capitalize();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),      drawerEnableOpenDragGesture: false,
      drawer: NavigationDrawer(),
      body: isLoading
          ? Center(
        child: Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      )
          : NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 55,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "${widget.category.Capitalize()}",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                          author: articles[index].author,
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                          url: articles[index].url);
                    }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension MyExtension on String {
  String Capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
