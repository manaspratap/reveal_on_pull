import 'package:flutter/material.dart';
import 'package:reveal_on_pull/reveal_on_pull.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reveal on pull - Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Reveal on pull - Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();
  final double widgetToRevealHeight = 180;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: RevealOnPull(
        scrollController: scrollController,
        animationDuration: const Duration(milliseconds: 500),
        widgetToRevealHeight: widgetToRevealHeight,
        widgetToReveal: Container(
          height: widgetToRevealHeight,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
        ),
        scrollableChild: CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  for (var index = 0; index < 100; index++)
                    Container(
                      height: 100,
                      decoration: BoxDecoration(border: Border.all(width: 0.1)),
                      alignment: Alignment.center,
                      child: Text('$index'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
