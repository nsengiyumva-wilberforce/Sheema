import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheema/screens/device_details.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sheema Device Monitor',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: AnimatedSplashScreen(
        splash: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Sheema Device Monitor ',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        nextScreen: const HomeScreen(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Theme.of(context).primaryColor,
        duration: 3000,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Sheema Device Monitor',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Monitor your device from anywhere!',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white54),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/images/profile.png'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                      'Device 1',
                      Icons.video_chat_rounded,
                      Colors.deepOrange,
                      "Active",
                      1),
                  itemDashboard(
                      'Device 2',
                      Icons.video_chat_rounded,
                      Colors.deepOrange,
                      "Inactive",
                      2),
                  itemDashboard(
                      'Device 3',
                      Icons.video_chat_rounded,
                      Colors.deepOrange,
                      "Active",
                      3),
                  itemDashboard(
                      'Device 4',
                      Icons.video_chat_rounded,
                      Colors.deepOrange,
                      "Inactive",
                      4),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background,
          String status, int deviceId) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeviceDetailsScreen(
                deviceId: deviceId,
                status: status,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: background, shape: BoxShape.circle),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                status,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      );
}
