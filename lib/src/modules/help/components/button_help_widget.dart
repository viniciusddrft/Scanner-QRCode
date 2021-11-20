import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonHelpWidget extends StatelessWidget {
  final String problem;
  final String solution;

  const ButtonHelpWidget(
      {required this.problem, required this.solution, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/Solution',
          arguments: <String, String>{
            'problem': problem,
            'solution': solution
          }),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
            width: MediaQuery.of(context).size.width,
            height: 80.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  problem,
                  style: TextStyle(fontSize: 18.sp),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
