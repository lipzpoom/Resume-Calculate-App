import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          // Floating action menu item
          Bubble(
            title: "Back",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.arrow_back_ios,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              Navigator.pop(context);
            },
          ),
          // Floating action menu item
          Bubble(
            title: "Resume App",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.person,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              Navigator.pushNamed(context, '/resume_app');
            },
          ),
          //Floating action menu item
          Bubble(
            title: "BMI Calculate App",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.calculate,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              Navigator.pushNamed(context, '/calculate_app');
            },
          ),
        ],
        // animation controller
        animation: _animation,
        // On pressed change animation state
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),
        // Floating Action button Icon color
        iconColor: Colors.blue,
        // Flaoting Action button Icon
        iconData: Icons.change_circle_outlined,
        backGroundColor: Colors.white,
      ),
    );
  }
}
