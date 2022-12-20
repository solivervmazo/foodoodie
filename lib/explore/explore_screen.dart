import 'package:flutter/material.dart';
import 'package:foodoodie/dev/test_scaffold_widget.dart';
import 'package:foodoodie/shared/layouts/bootstrap.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Bootstrap(
      body: TestScaffoldWidget(),
    );
  }
}
