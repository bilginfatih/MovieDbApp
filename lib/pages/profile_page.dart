import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
  static var username = '';
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController t1 = TextEditingController();

  userEkle() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(MyApp.auth.currentUser!.uid)
        .update({'user': t1.text});
  }

  userGetir() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(MyApp.auth.currentUser!.uid)
        .get()
        .then((gelenVeri) {
      setState(() {
        ProfilePage.username = gelenVeri.data()!['user'] ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: TextField(
              controller: t1,
              cursorColor: Colors.black,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              onSubmitted: (value) {
                userEkle();
                userGetir();
                t1.clear();
              },
              decoration: InputDecoration(
                focusColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: 'Kullanıcı Adı',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
