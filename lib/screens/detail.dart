import 'package:flutter/material.dart';

import '../services/database.dart';
import '../services/shared_pref.dart';

class Details extends StatefulWidget {
  final String image, name, detail, price, sender, reciever;

  const Details({
    super.key,
    required this.detail,
    required this.image,
    required this.name,
    required this.price,
    required this.sender,
    required this.reciever,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1, total = 0;
  String? id;

  getTheSharedPref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  onTheLoad() async {
    await getTheSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    onTheLoad();
    total = int.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                      total = total - int.parse(widget.price);
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF0EBA8E),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Text(
                  a.toString(),
                ),
                const SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    ++a;
                    total = total + int.parse(widget.price);
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF0EBA8E),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.detail,
              maxLines: 4,
            ),
            const SizedBox(height: 30.0),
            const Row(
              children: [
                Text(
                  "Delivery Time",
                ),
                SizedBox(width: 25.0),
                Icon(
                  Icons.alarm,
                  color: Colors.black54,
                ),
                SizedBox(width: 5.0),
                Text(
                  "1 hour",
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Row(
              children: [
                const Text(
                  "Senders Address: ",
                ),
                Text(
                  widget.sender,
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Row(
              children: [
                const Text(
                  "Reciever Address: ",
                ),
                const SizedBox(height: 25.0),
                Text(
                  widget.reciever,
                ),
              ],
            ),
            const SizedBox(width: 25.0),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Quantity Required",
                      ),
                      Text(
                        "$a",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      Map<String, dynamic> addFoodToCart = {
                        "Name": widget.name,
                        "Quantity": a.toString(),
                        "Total": total.toString(),
                        "Image": widget.image
                      };
                      await DatabaseMethods().addFoodToCart(addFoodToCart, id!);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Text(
                            "Items Added to Cart",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0EBA8E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Receive",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
