import 'package:flutter/material.dart';
import 'package:pixwalz/views/widgets/customAppBar.dart';
import 'package:pixwalz/views/widgets/searchBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: CustomAppBar(
          word1: 'Pix',
          word2: 'Walz',
        ),
      ),
      body: Column(
        children: [
          SearchB(),
        ],
      ),
    );
  }
}
