import 'package:flutter/material.dart';

import 'add_new_customer_profle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home Screen ",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AddNewCustomerProfileScreen()));
              },
                elevation: 8,
                clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Text(
                "Update Profile",
                style: TextStyle(
                    color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              )

            ],
          )),
    );
  }
}
