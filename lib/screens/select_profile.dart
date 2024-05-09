import 'package:flutter/material.dart';
import 'package:vibhu_epics/screens/donor_detail_2.dart';
import 'package:vibhu_epics/screens/recieve.dart';

class SelectProfile extends StatefulWidget {
  const SelectProfile({super.key});

  @override
  State<SelectProfile> createState() => _SelectProfileState();
}

class _SelectProfileState extends State<SelectProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 250.0),
              const Text(
                'Want to share food?',
                style: TextStyle(
                  color: Color(0xFF2B911B),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Become the part in this beautiful\nfood giving process',
                style: TextStyle(
                  color: Color(0xFF504E4E),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25.0),
              const Divider(),
              const SizedBox(height: 25.0),
              const Text(
                'Choose your Role',
                style: TextStyle(
                  color: Color(0xFF504E4E),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20.0),
              RoundedCheckboxContainer(
                text: 'Donor',
                subTitle: 'Donate some food to the needful.',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddFood(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 25.0),
              RoundedCheckboxContainer(
                text: 'Reciever',
                subTitle: 'Pickup and deliver food to the needful.',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Recieve(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedCheckboxContainer extends StatefulWidget {
  final String text;
  final String subTitle;
  final ValueChanged<bool>? onChanged;
  final bool initialValue;
  final Function()? onTap;

  const RoundedCheckboxContainer({
    super.key,
    required this.text,
    this.onChanged,
    this.initialValue = false,
    required this.subTitle,
    required this.onTap,
  });

  @override
  _RoundedCheckboxContainerState createState() =>
      _RoundedCheckboxContainerState();
}

class _RoundedCheckboxContainerState extends State<RoundedCheckboxContainer> {
  late bool _isChecked;

  @override
  void initState() {
    _isChecked = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                      if (widget.onChanged != null) {
                        widget.onChanged!(_isChecked);
                      }
                    });
                  },
                ),
                Text(
                  widget.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              widget.subTitle,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
