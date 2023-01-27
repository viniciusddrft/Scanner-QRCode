import 'package:flutter/material.dart';

class ButtonHelpWidget extends StatelessWidget {
  final String problem;
  final String solution;

  const ButtonHelpWidget(
      {required this.problem, required this.solution, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.zero,
        ),
        onPressed: () => Navigator.pushNamed(context, '/Solution',
            arguments: <String, String>{
              'problem': problem,
              'solution': solution
            }),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Row(
            children: [
              const Spacer(),
              Flexible(
                flex: 15,
                child: Text(
                  problem,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
