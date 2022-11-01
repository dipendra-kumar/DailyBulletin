import 'package:flutter/material.dart';
import 'article_view.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  final String? author;

  const BlogTile(
      {super.key,
        required this.imageUrl,
        required this.title,
        required this.desc,
        required this.url,
        required this.author
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return
                    ArticleView(blogUrl: url, title: title,);
                  }));
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 3.5,

                    )
                  ]

              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(imageUrl)),
                  SizedBox(
                    height: 8,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, right: 10, left: 5),
                    child: Text(desc,
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black54)),
                  ),
                  (author == null) ? SizedBox(height: 5,) : Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      (author == null) ? SizedBox(height: 0,) :  Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text( "  ${(author == null) ? '' : author!}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
