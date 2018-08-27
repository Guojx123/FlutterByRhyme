import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FittedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/FittedBox';
  final String detail =
      '''Scales and positions its child within itself according to fit.
See also:
Transform, which applies an arbitrary transform to its child widget at paint time.
The catalog of layout widgets.''';

  @override
  _FittedBoxDemoState createState() => _FittedBoxDemoState();
}

class _FittedBoxDemoState extends ExampleState<FittedBoxDemo> {
  FittedBoxSetting setting;

  @override
  void initState() {
    setting = FittedBoxSetting(
      fit: fitValues[0],
      alignment: alignmentValues[0],
      child:  Value(
        value: SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
        ),
        label: '''SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
        )''',
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''FittedBox(
      fit: ${setting.fit?.label ?? ''},
      alignment: ${setting.alignment?.label ?? ''},
      child:  ${setting.child?.label ?? ''},
    );''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kFit),
      RadioListTile(
          value: setting.fit,
          groupValue: fitValues,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(fit: value);
            });
          }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'FittedBox';
  }

  @override
  Widget getWidget() {
    return FittedBox(
      fit: setting.fit?.value,
      alignment: setting.alignment?.value,
      child: setting.child?.value,
    );
  }
}

class FittedBoxSetting {
  final Value<BoxFit> fit;
  final Value<AlignmentGeometry> alignment;
  final Value<Widget> child;

  FittedBoxSetting({
    this.fit,
    this.alignment,
    this.child,
  });

  FittedBoxSetting copyWith({
    Value<BoxFit> fit,
    Value<AlignmentGeometry> alignment,
    Value<Widget> child,
  }) {
    return FittedBoxSetting(
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      child: child ?? this.child,
    );
  }
}
