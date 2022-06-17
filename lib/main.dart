

import 'package:flutter/material.dart';
import 'package:qr_code_app/style/style.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImage(data: data,backgroundColor: Colors.white,
            version: QrVersions.auto,
            size: 300.0,
            ),
          ),
          const SizedBox(
            height:24 ,
          ),
          Container(
            width: 300.0,
              child: TextField(
                // we will generate new qr when user type new value
                onChanged: (value){
                  setState(() {
                    data = value;
                  });
                },
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              decoration:InputDecoration(
                hintText: "Type the data",
                filled: true,
                fillColor: AppStyle.textInputColor,
                border: InputBorder.none
              )
    ),
          ),
          const SizedBox(
            height: 24.0,),
          RawMaterialButton(onPressed: () {

          },
            fillColor: AppStyle.accentColor,

            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 16.0,
            ),
          child: const Text(
              "Generating  QR code"),
          )


        ],
      ),
    );
  }
}




