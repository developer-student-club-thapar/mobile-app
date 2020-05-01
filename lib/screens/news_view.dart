import 'package:dsc_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsView extends StatefulWidget {
  final String url;
  NewsView({this.url});

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  AnimationController animationController;
  Animation animation;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.launch(widget.url);
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.slowMiddle);
    animationController.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.addListener(() {
      opacity = animation.value;
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onBack() async {
      bool back = await flutterWebviewPlugin.canGoBack();
      if (back) {
        await flutterWebviewPlugin.goBack();
        Navigator.pop(context, false);
      } else
        Navigator.pop(context, true);
    }

    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: blueColor.withOpacity(opacity),
                      width: 5,
                    ),
                    right: BorderSide(
                        color: yellowColor.withOpacity(opacity), width: 2),
                    bottom: BorderSide(
                        color: redColor.withOpacity(opacity), width: 2),
                    left: BorderSide(
                        color: greenColor.withOpacity(opacity), width: 2))),
            height: kheight(context),
            width: kwidth(context),
            child: WebviewScaffold(
              url: widget.url,
              withJavascript: true,
              withZoom: true,
            ),
          ),
        ),
      ),
    );
  }
}
