import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid = AndroidInitializationSettings('icon_app');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeekForGeeks Flutter Notifications'),
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            color: Colors.green,
            onPressed: () async {
              await flutterLocalNotificationsPlugin.show(
                0,
                "Hello",
                "Hi there",
                NotificationDetails(
                    android: AndroidNotificationDetails(
                  'Channel_id',
                  'Channel_name',
                  'Channel_decription',
                )),
              );
            },
            child: Text(
              "Show Notifications",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
