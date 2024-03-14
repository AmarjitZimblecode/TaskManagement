import 'package:flutter/material.dart';

import '../helpers/color_helper.dart';
import '../helpers/constant_helper.dart';

class NoRouteFoundScreen extends StatelessWidget {
  const NoRouteFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelper.instance.whiteColor,
        centerTitle: true,
        title: const Text('No Route Found'),
      ),
      body: Center(
        child: Text('Restart Your App',
        style: TextStyle(
            color: ColorHelper.instance.blackColor,
            fontSize: ConstantHelper.instance.size_20,
            fontWeight: ConstantHelper.instance.w500
        ),
        ),
      ),
    );
  }
}