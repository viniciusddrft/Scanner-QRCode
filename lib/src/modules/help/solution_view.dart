import 'package:flutter/material.dart';

class SolutionView extends StatelessWidget {
  final String problem;
  final String solution;

  const SolutionView({required this.problem, required this.solution, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(problem),
      ),
      body: SizedBox(
        width: _size.width,
        height: _size.height,
        child: Padding(
          padding: EdgeInsets.all(_size.height * 0.04),
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
