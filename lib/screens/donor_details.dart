import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/profile_text_field.dart';

class DonorDetail extends StatefulWidget {
  const DonorDetail({super.key});

  @override
  State<DonorDetail> createState() => _DonorDetailState();
}

class _DonorDetailState extends State<DonorDetail> {
  TextEditingController companyName = TextEditingController();
  TextEditingController contactPerson = TextEditingController();
  TextEditingController phoneCode = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController alternatePhoneCode = TextEditingController();
  TextEditingController alternatePhone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController add1 = TextEditingController();
  TextEditingController add2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController gstNo = TextEditingController();
  TextEditingController regNo = TextEditingController();
  TextEditingController description = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;
  bool isLoading = false;
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
    if (index == 0) {
      _scaffoldKey.currentState?.openDrawer();
    }
    if (index == 3) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop(); // Pop the current route
      } else {
        // Show the exit button functionality
      }
    }
  }

  @override
  void dispose() {
    companyName.dispose();
    contactPerson.dispose();
    phoneCode.dispose();
    phone.dispose();
    alternatePhoneCode.dispose();
    alternatePhone.dispose();
    email.dispose();
    add1.dispose();
    add2.dispose();
    city.dispose();
    state.dispose();
    pinCode.dispose();
    gstNo.dispose();
    regNo.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Add Agent Reseller",
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: companyName,
                    keyBoardType: TextInputType.text,
                    hintText: "Agent Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Agent Name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: contactPerson,
                    keyBoardType: TextInputType.text,
                    hintText: "Contact person",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Contact Person cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 6.h,
                        width: 13.w,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: CupertinoColors.extraLightBackgroundGray,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Text(
                              "+91",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75.w,
                        child: ProfileTextField(
                          controller: phone,
                          keyBoardType: TextInputType.number,
                          hintText: "Phone",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 6.h,
                        width: 13.w,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Text(
                              "+91",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 75.w,
                        child: ProfileTextField(
                          controller: alternatePhoneCode,
                          keyBoardType: TextInputType.number,
                          hintText: "Alternate Phone",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Alternate Phone cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: email,
                    keyBoardType: TextInputType.emailAddress,
                    hintText: "Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: add1,
                    keyBoardType: TextInputType.text,
                    hintText: "Address Line 1",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Address Line 1 cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: add2,
                    keyBoardType: TextInputType.text,
                    hintText: "Address Line 2",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Address Line 2 cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: city,
                    keyBoardType: TextInputType.text,
                    hintText: "City",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "City cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: state,
                    keyBoardType: TextInputType.text,
                    hintText: "State",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "State cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: pinCode,
                    keyBoardType: TextInputType.text,
                    hintText: "PinCode",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "PinCode cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: gstNo,
                    keyBoardType: TextInputType.text,
                    hintText: "GST No.",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "GST No. cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: regNo,
                    keyBoardType: TextInputType.text,
                    hintText: "Registration No.",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Registration No. cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  ProfileTextField(
                    controller: description,
                    keyBoardType: TextInputType.text,
                    hintText: "Description",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Description cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
