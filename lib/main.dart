import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/screens/favorites.dart';
import 'package:gym_app/screens/home.dart';
import 'package:provider/provider.dart';

import 'models/favorites.dart';

//firestore stuff
// var db = FirebaseFirestore.instance;
// var data = {'favorites.dart': favorites.dart.map((f) => f.toLowerCase().asString)};
// db
//     .collection('favorites.dart')
//     .doc('current')
//     .set(data, SetOptions(merge: true));

// updateFavorites();
// db.collection('favorites.dart').get().then((event) {
// for (var doc in event.docs) {
// print('${doc.id} => ${doc.data()}');
// }
// });

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseFirestore.instance.settings = const Settings(
  //   host: '127.0.0.1:8080',
  //   sslEnabled: false,
  //   persistenceEnabled: false,
  // );
  runApp(MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: FavoritesPage.routeName,
          builder: (context, state) {
            return const FavoritesPage();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
