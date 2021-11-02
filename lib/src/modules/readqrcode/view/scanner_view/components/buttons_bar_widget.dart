import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BurronsBarWidget extends StatelessWidget {
  const BurronsBarWidget();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.h,
      right: 20.w,
      child: Row(
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: 18.sp),
            ),
          )
        ],
      ),
    );
  }
}
