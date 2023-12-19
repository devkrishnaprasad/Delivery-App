import 'package:delivery_app/cards/item_cards.dart';
import 'package:delivery_app/cards/main_category_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.grey,
              ),
              child: Image.asset('assets/images/profile_img.png'),
            ),
          )
        ],
        leading: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
                size: 40.0,
                color: Color.fromARGB(255, 110, 91, 91),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wizklub",
                  style: TextStyle(
                    fontFamily: 'Bold',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Wizklub, Floriana Estates  ...",
                  style: TextStyle(
                      fontFamily: '',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        leadingWidth: 300,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(width: 0.8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Search ...',
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.mic,
                      size: 30.0,
                    ),
                    onPressed: () {
                      print("Mic Icon is presses....");
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              child: Container(
                height: 150,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner_img.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: MainCategoryCard(),
            ),
          ],
        ),
      ),
    );
  }
}
