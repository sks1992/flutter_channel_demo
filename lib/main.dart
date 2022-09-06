import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const channel =MethodChannel("SKS");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Call Native code to show toast message:',
            ),
            ElevatedButton(
              onPressed: _showToast,
              child: const Text("Show toast"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showToast() async {
    final int showToast = await channel.invokeMethod('showToast',<String,String>{
      'msg':"this is a toast from flutter to android native"
    });
  }

}
//Client(flutter code)->send->Method Channel -> send ->Host(JAVA,KOTLIN,ObjectC,Swift) -> invoke Method -> Platform SDK
//                    <-response<-           <-response<-