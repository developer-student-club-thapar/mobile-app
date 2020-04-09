import 'package:dsc_app/networking/networking.dart';
import 'package:url_launcher/url_launcher.dart';

class News{

  Networking networkObj  = Networking();

  Future<List<dynamic>> getData() async {
    var data = await networkObj.getData('https://hacker-news.firebaseio.com/v0/beststories.json');
    return data;
  }


  Future getItemData(int item) async {
    return await networkObj.getData('https://hacker-news.firebaseio.com/v0/item/$item.json');
  }

  Future launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

}