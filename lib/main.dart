import 'package:eventapp/src/config/router.dart';
import 'package:eventapp/src/util/firebase_notification_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:eventapp/src/viewmodel/event_viewmodel.dart';
import 'package:eventapp/src/viewmodel/category_viewmodel.dart';
import 'package:eventapp/src/viewmodel/featured_event_viewmodel.dart';
import 'package:eventapp/src/viewmodel/user_viewmodel.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    FirebaseNotificationManager _firebaseMessaging =
        FirebaseNotificationManager();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EventViewModel>(
          create: (context) => EventViewModel(),
        ),
        ChangeNotifierProvider<FeaturedEventViewModel>(
          create: (context) => FeaturedEventViewModel(),
        ),
        ChangeNotifierProvider<CategoryViewModel>(
          create: (context) => CategoryViewModel(),
        ),
        ChangeNotifierProvider<UserViewModel>(
          create: (context) => UserViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evento',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Roboto')),
        onGenerateRoute: Router.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
