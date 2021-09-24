import 'package:flutter/material.dart';

import 'web_view_screen.dart';

enum PermissionGroup {
  locationAlways,

  locationWhenInUse
}

class EnterURlScreen extends StatefulWidget {
  const EnterURlScreen({Key? key}) : super(key: key);

  @override
  _EnterURlScreenState createState() => _EnterURlScreenState();
}

class _EnterURlScreenState extends State<EnterURlScreen> {
  final myController = TextEditingController();
  bool isProcess = false, isLocationPermission = false;

  @override
  void initState() {
    super.initState();
    myController.addListener(editText);
  }

  void editText() {
    if (myController.text.length > 0) {
      setState(() {
        isProcess = true;
      });
    } else {
      setState(() {
        isProcess = false;
      });
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    autofocus: true,
                    controller: myController,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                      ),
                      hintText: 'Please Enter URL',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: isProcess ? Colors.blue : Colors.grey,
                  onPressed: () {
                    if (isProcess) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => WebViewMainScreen(
                              url: myController.text.toString()),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Processed",
                    style: TextStyle(
                        color: isProcess ? Colors.white : Colors.black54,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
