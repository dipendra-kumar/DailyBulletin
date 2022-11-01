import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  final String title;

  const ArticleView({super.key, required this.blogUrl, required this.title});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        leadingWidth: 45,
        title: Text("${widget.title}"),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Stack(
              children: <Widget>[
                WebView(
                  initialUrl: widget.blogUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (finish) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Stack(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
