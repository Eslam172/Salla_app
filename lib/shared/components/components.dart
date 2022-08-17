import 'package:flutter/material.dart';

Future navigateTo(context,widget) => Navigator
    .push(context, MaterialPageRoute(builder: (context) => widget));

Future navigateAndFinish(context,widget) => Navigator
    .pushReplacement(context, MaterialPageRoute(builder: (context) => widget));