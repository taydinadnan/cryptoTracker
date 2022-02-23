import 'dart:ui';

import 'package:flutter/material.dart';

// State added
class GlassBottomNav extends StatefulWidget {
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final EdgeInsets padding;
  final int selectedIndex;
  final Function(int) onPressed;

  GlassBottomNav({
    Key? key,
    this.bevel = 15.0,
    required this.onPressed,
    required this.selectedIndex,
    this.padding = const EdgeInsets.all(1.5),
  })  : blurOffset = Offset(bevel / 2, bevel / 2),
        color = Colors.grey.shade900,
        super(key: key);

  @override
  _GlassBottomNavState createState() => _GlassBottomNavState();
}

class _GlassBottomNavState extends State<GlassBottomNav> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.greenAccent;
    const secondaryColor = Colors.grey;

    return Padding(
      padding:
          const EdgeInsets.only(bottom: 30.0, right: 10.0, left: 10.0, top: 2),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade900.withOpacity(0.15)),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    NavBarIcon(
                      text: "Home",
                      icon: Icons.home_outlined,
                      selected: widget.selectedIndex == 0,
                      onPressed: () => widget.onPressed(0),
                      defaultColor: secondaryColor,
                      selectedColor: primaryColor,
                    ),
                    NavBarIcon(
                      text: "Search",
                      icon: Icons.search_outlined,
                      selected: widget.selectedIndex == 1,
                      onPressed: () => widget.onPressed(1),
                      defaultColor: secondaryColor,
                      selectedColor: primaryColor,
                    ),
                    NavBarIcon(
                        text: "Cart",
                        icon: Icons.local_grocery_store_outlined,
                        selected: widget.selectedIndex == 2,
                        onPressed: () => widget.onPressed(2),
                        defaultColor: secondaryColor,
                        selectedColor: primaryColor),
                    NavBarIcon(
                      text: "Calendar",
                      icon: Icons.date_range_outlined,
                      selected: widget.selectedIndex == 3,
                      onPressed: () => widget.onPressed(3),
                      selectedColor: primaryColor,
                      defaultColor: secondaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
        AnimatedContainer(
          width: selected ? 50 : 0,
          height: 15,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(1),
              blurRadius: 50,
            )
          ]),
        ),
      ],
    );
  }
}
