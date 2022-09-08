import 'package:flutter/material.dart';

/// This widget is used to create a custom background for the app.
/// Is recommended to use as Child of [Scaffold] widget.
class CustomBackground extends StatelessWidget {
  final Widget child;
  final String imageUrl;
  final double opacity;
  const CustomBackground({
    required this.child,
    required this.imageUrl,
    Key? key,
    this.opacity = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.cover,
              onError: (object, stack) {
                debugPrint("Error loading image: $object");
              },
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(opacity),
        ),
        child,
      ],
    );
  }
}
