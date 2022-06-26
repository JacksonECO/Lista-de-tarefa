import 'package:flutter/material.dart';
import 'package:lista_de_tarefa/widget/button.dart';

class ButtonLoading extends StatefulWidget {
  final String? text;
  final Widget? child;

  final Function()? onTap;
  final Color? colorButton;
  final double radius;
  final double? fontSize;
  final double width;
  final double height;
  final bool isAnimation;

  const ButtonLoading({
    Key? key,
    this.text,
    this.child,
    this.onTap,
    this.colorButton,
    this.radius = 25,
    this.fontSize = 17,
    this.width = 200,
    this.height = 45,
    this.isAnimation = true,
  })  : assert(text != null || child != null),
        super(key: key);

  @override
  State<ButtonLoading> createState() => _ButtonLoadingState();
}

class _ButtonLoadingState extends State<ButtonLoading> with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  late final Animation<double> animation;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: widget.width, end: widget.height * 2).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.colorButton ?? Theme.of(context).primaryColor,
          ),
          width: animation.value,
          height: widget.height,
          child: Button(
            onTap: _isLoading
                ? null
                : () async {
                    if (widget.onTap == null) return;

                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      if (widget.isAnimation) controller.forward();
                      await widget.onTap!();
                      await Future.delayed(const Duration(milliseconds: 100));
                      if (widget.isAnimation) controller.reverse();
                    } catch (_) {}
                    setState(() {
                      _isLoading = false;
                    });
                  },
            child: _isLoading
                ? Center(
                    child: SizedBox(
                      height: widget.height * 0.5,
                      width: widget.height * 0.5,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    ),
                  )
                : Center(
                    child: widget.child ??
                        Text(
                          widget.text!,
                          style: TextStyle(fontSize: widget.fontSize, color: Colors.white),
                        ),
                  ),
          ),
        );
      },
    );
  }
}
