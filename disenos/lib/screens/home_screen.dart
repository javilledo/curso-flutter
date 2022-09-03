
import 'package:disenos/widgets/card_table.dart';
import 'package:flutter/material.dart';

import 'package:disenos/widgets/background.dart';
import 'package:disenos/widgets/custom_bottom_navigation.dart';
import 'package:disenos/widgets/page_title.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [

          //Background
          Background(),

          // Home Body
          _HomeBody()

        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const[

          // Titles
          PageTitle(),

          // Card Table
          CardTable()

        ],
      ),
    );
  }
}