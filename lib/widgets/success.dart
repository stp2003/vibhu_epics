import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SuccessDialogBox extends StatelessWidget {
  final String content;
  const SuccessDialogBox({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Image.asset(
              'assets/success.png',
              height: 85,
              width: 85,
            ),
            SizedBox(height: 5.h),
            Text(
              content,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
