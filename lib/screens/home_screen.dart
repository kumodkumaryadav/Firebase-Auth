import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebase service/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  String token = '';
  //why we need this method ? since we can not call future function directly in to the inItState
  getToken() async {
    token = await Auth().getDeviceToken() ?? '';
    setState(() {});
  }

  @override
  initState() {
    getToken();
    super.initState();
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _userPhoto() {
    return CircleAvatar(
      backgroundImage: NetworkImage(user?.photoURL ?? 'user photo'),
      radius: 50,
    );
  }

  Widget _userToken() {
    return Text(user!.getIdToken() as String);
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  // Widget AddLinkWidget(){
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        color: const Color.fromARGB(94, 68, 252, 12),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _userPhoto(),
            _userUid(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
