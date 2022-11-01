import 'package:flutter/material.dart';
import 'package:news_flutter/helper/data.dart';
import 'package:news_flutter/helper/news.dart';
import 'package:news_flutter/models/article_model.dart';
import 'package:news_flutter/models/category_model.dart';
import 'blog_tile.dart';
import 'navigation_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      drawerEnableOpenDragGesture: false,
      drawer: NavigationDrawer(),
      body: isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(

              floating: true,
              flexibleSpace: FlexibleSpaceBar(title: Text("Top Headlines", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),),
            )
          ];
        },
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                  child: Column(
                    children: [
                      ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                                author: articles[index].author,
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].description,
                                url: articles[index].url);
                          })
                    ],
                  ),
                ),
              ),
          ),
    );
  }
}
