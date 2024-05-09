import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vibhu_epics/widgets/profile_text_field.dart';

class DonationType extends StatefulWidget {
  const DonationType({super.key});

  @override
  State<DonationType> createState() => _DonationTypeState();
}

class _DonationTypeState extends State<DonationType> {
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();
  TextEditingController dateC = TextEditingController();

  final List<String> foodItems = ['Veg', 'Non-Veg', 'Jain', 'Vegan'];
  String? value;

  int a = 1, total = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Listing Type: Donation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 4.h),
                const Text(
                  'Add Title',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 1.h),
                ProfileTextField(
                  controller: titleC,
                  keyBoardType: TextInputType.text,
                  hintText: "Add Food Title",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Contact Person cannot be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 4.h),
                const Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 1.h),
                ProfileTextField(
                  controller: descC,
                  keyBoardType: TextInputType.text,
                  hintText: "Add Description",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Contact Person cannot be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 4.h),
                const Text(
                  'Type Of Food',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: foodItems
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: ((value) => setState(
                              () {
                                this.value = value;
                              },
                            )),
                        dropdownColor: Colors.white,
                        hint: const Text("Select Category"),
                        iconSize: 36,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        value: value,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Number of people',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (a > 1) {
                                --a;
                                total = total - a;
                              }
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
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
                              total = total + a;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
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
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                const Text(
                  'Food Expiration Date',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 1.h),
                ProfileTextField(
                  controller: dateC,
                  keyBoardType: TextInputType.text,
                  hintText: "Date",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Contact Person cannot be empty";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
