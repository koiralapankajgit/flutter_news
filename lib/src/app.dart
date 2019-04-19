import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return NewsList();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          // Extract the item id from setting.name
          // Below line will convert '/767677' string into 767677 integer
          final int itemId = int.parse(settings.name.replaceFirst('/', ''));
          // and pass into newsDetail
          // A fantastic location to do some initialization or data fetching for NewsDetail
          return NewsDetail(
            itemId: itemId,
          );
        },
      );
    }
  }
}
