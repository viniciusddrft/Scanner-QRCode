import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SolutionView extends StatelessWidget {
  final String problem;
  final String solution;

  const SolutionView({required this.problem, required this.solution, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff202020),
        title: Text(problem),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(30.0.sp),
          child: Column(
            children: [
              Text(
                solution,
                style: TextStyle(fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
