import 'package:flutter/material.dart';
import 'package:nounproject/services/local_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required String title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  bool authenticated = false;

  @override
  Widget build(BuildContext buildContext){
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOUN Biometric Authentication Project'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(onPressed: () async {
            final authenticate = await LocalAuth.authenticate();
            setState(() {
              authenticated = authenticate;
            });
          }, child: const Text('Authenticate'),
          ),
            if(authenticated) const Text("You are authenticated"),
            if(authenticated) ElevatedButton(onPressed: () {
              setState(() {
                authenticated = false;
              });
            }, child: const Text("Log out"))
          ],
        ),
      ),
    );
  }
}