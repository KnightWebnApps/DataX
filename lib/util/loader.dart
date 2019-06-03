import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class XLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlareActor(
        'assets/loader.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'rotate',
      ),
    );
  }
}