// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaride/models/scan_models.dart';
import 'package:qaride/providers/db_provaider.dart';
import 'package:qaride/providers/iustate.dart';
import 'package:qaride/screens/direccionespages.dart';
import 'package:qaride/screens/mapapage.dart';
import 'package:qaride/screens/mapaspage.dart';
import 'package:qaride/widget/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Historial'),
        actions: const [
          Icon(Icons.delete_forever),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanBotton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UIProvaider = Provider.of<UIServices>(context);
    final currentIndex = UIProvaider.SelectedIndex;

    // final tempScan = new ScanModel(valor: 'http://google.com');
    DBProvider.db.getTodosScans().then(print);

    switch (currentIndex) {
      case 0:
        return const MapaspagesScreen();
      case 1:
        return const DireccionespagesScreen();
      default:
        return const MapaPage();
    }
  }
}
