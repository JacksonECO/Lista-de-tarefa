import 'package:flutter/material.dart';

class Button extends InkWell {
  const Button({
    super.key,
    super.child,
    super.onTap,
  }) : super(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        );
}
