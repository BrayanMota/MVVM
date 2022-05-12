import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:unitins_imc/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeViewModel = HomeViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            TextField(
              onChanged: (value) => homeViewModel.height = value,
              decoration: const InputDecoration(
                  label: Text('Altura'), border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              onChanged: (value) => homeViewModel.weight = value,
              decoration: const InputDecoration(
                  label: Text('Peso'), border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  homeViewModel.calculateIMC();
                },
                child: const Text('Calcular')),
            const SizedBox(
              height: 16,
            ),
            RxBuilder(
              builder: (_) => Text(homeViewModel.result),
            ),
          ],
        ),
      ),
    );
  }
}
