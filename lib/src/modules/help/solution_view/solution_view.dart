import 'package:flutter/material.dart';

class SolutionView extends StatelessWidget {
  final String problem, solution;

  const SolutionView(
      {required this.problem, required this.solution, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(problem),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.04),
          child: Column(
            children: [
              Text(
                solution,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
