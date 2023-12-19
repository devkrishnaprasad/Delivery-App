import 'package:flutter/material.dart';

class MainCategoryCard extends StatefulWidget {
  const MainCategoryCard({super.key});

  @override
  State<MainCategoryCard> createState() => _MainCategoryCardState();
}

class _MainCategoryCardState extends State<MainCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20.0,
        ),
        itemCount: 17,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Chips_img.png'),
                  ),
                  color: Colors.grey,
                ),
              ),
              const Text('Chips & Namkeen',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ],
          );
        },
      ),
    );
  }
}
