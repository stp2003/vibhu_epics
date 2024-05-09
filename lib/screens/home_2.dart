import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/database.dart';
import 'detail.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  bool vegg = false, nonVegg = false, jain = false, vegan = false;

  Stream? foodItemStream;

  onTheLoad() async {
    foodItemStream = await DatabaseMethods().getFoodItem('Veg');
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
      stream: foodItemStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            image: ds['Image'],
                            name: ds['Name'],
                            detail: ds['Detail'],
                            price: ds['Quantity'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  ds['Image'],
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                ds['Name'],
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                ds['Detail'],
                                maxLines: 1,
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                'Quantity: ' + ds['Quantity'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget allItemsVertical() {
    return StreamBuilder(
      stream: foodItemStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            image: ds['Image'],
                            name: ds['Name'],
                            detail: ds['Detail'],
                            price: ds['Quantity'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  ds['Image'],
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds['Name'],
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds['Detail'],
                                      maxLines: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "Quantity: " + ds['Quantity'],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello There,",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: showItem(),
              ),
              const SizedBox(height: 30.0),
              SizedBox(height: 270, child: allItems()),
              const SizedBox(height: 30.0),
              allItemsVertical(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            vegg = true;
            nonVegg = false;
            jain = false;
            vegan = false;
            foodItemStream = await DatabaseMethods().getFoodItem('Veg');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: vegg ? const Color(0xFF0EBA8E) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/veg.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                //color: tools ? Colors.white : Colors.green,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            vegg = false;
            nonVegg = true;
            jain = false;
            vegan = false;
            foodItemStream = await DatabaseMethods().getFoodItem('NonVeg');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: nonVegg ? const Color(0xFF0EBA8E) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/nonveg.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                //color: seeds ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            vegg = false;
            nonVegg = false;
            jain = true;
            vegan = false;
            foodItemStream = await DatabaseMethods().getFoodItem('Jain');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: jain ? const Color(0xFF0EBA8E) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/jain.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                // color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            vegg = false;
            nonVegg = false;
            jain = false;
            vegan = true;
            foodItemStream = await DatabaseMethods().getFoodItem('Vegan');
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: vegan ? const Color(0xFF0EBA8E) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/vegan.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                //color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
