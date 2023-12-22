import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleItemCardState extends StatefulWidget {
  const SingleItemCardState({super.key});

  @override
  State<SingleItemCardState> createState() => _SingleItemCardStateState();
}

RxBool cardActive = false.obs;
RxInt itemCount = 0.obs;

class _SingleItemCardStateState extends State<SingleItemCardState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
            child: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/location_img.png'),
                  ),
                  color: Colors.blue),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Text("Testing Product."),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Text("Oil."),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Row(
              children: [
                const Column(
                  children: [Text("₹116"), Text("₹150")],
                ),
                Obx(() {
                  return cardActive.value
                      ? Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Container(
                            width: 106,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green,
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (itemCount.value != 1) {
                                      itemCount.value -= 1;
                                    } else {
                                      itemCount.value = 0;
                                      cardActive.value = false;
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.minimize,
                                    color: Colors.white,
                                  ),
                                ),
                                Obx(() {
                                  return Text(
                                    itemCount.value.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  );
                                }),
                                IconButton(
                                  onPressed: () {
                                    itemCount.value += 1;
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                          child: TextButton(
                            onPressed: () {
                              cardActive.value = true;
                              itemCount.value = 1;
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.green),
                              ),
                            ),
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
