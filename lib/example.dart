import 'package:flutter/material.dart';
import 'package:lesson_20/inherit.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DesignWidgetProvider(
      model: DesignModel(),
      child: const Scaffold(
        body: _GradientBackWidget(
          child: _TextWidget(),
        ),
      ),
    );
  }
}

class _GradientBackWidget extends StatelessWidget {
  const _GradientBackWidget({
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final model = DesignWidgetProvider.read(context)!.model;
    final colors = model.gradientColors;
    final beginDirection = model.beginDirection;
    final endDirection = model.endDirection;
    return Stack(children: [
      Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: beginDirection,
            end: endDirection,
            colors: colors,
          ),
        ),
      ),
      _RiceWidget(child: child)
    ]);
  }
}

class _RiceWidget extends StatelessWidget {
  const _RiceWidget({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final model = DesignWidgetProvider.watch(context)!.model;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => model.generateRandomDice(),
            child: const Text('Roll dice!'),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 20),
              ),
              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            ),
          )
        ],
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget();

  @override
  Widget build(BuildContext context) {
    final model = DesignWidgetProvider.watch(context)!.model;
    return Hero(
      tag: 'Dice',
      child: SizedBox(
          width: 150,
          child: Image.asset('assets/images/dice-${model.diceValue}.png')),
    );
    // Text(
    //   text,
    //   style: TextStyle(color: defaultColor.withAlpha(100), fontSize: 48),
    // ),
  }
}
