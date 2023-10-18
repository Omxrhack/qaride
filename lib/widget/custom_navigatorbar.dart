import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaride/providers/iustate.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UIProvaider = Provider.of<UIServices>(context);
    final currentIndex = UIProvaider.SelectedIndex;

    return BottomNavigationBar(
      onTap: (value) => UIProvaider.SelectedIndex = value,
      currentIndex: currentIndex,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions), label: 'Direcciones'),
      ],
    );
  }
}
