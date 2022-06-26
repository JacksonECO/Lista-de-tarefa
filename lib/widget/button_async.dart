import 'package:flutter/material.dart';
import 'package:lista_de_tarefa/widget/button.dart';

class ButtonAsync extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  const ButtonAsync({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  State<ButtonAsync> createState() => _ButtonAsyncState();
}

class _ButtonAsyncState extends State<ButtonAsync> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: !_isLoading
          ? null
          : () async {
              if (widget.onTap == null) return;

              setState(() {
                _isLoading = true;
              });
              try {
                await widget.onTap!();
              } catch (_) {}
              setState(() {
                _isLoading = false;
              });
            },
      child: widget.child,
    );
  }
}
