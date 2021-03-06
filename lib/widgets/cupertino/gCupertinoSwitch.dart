import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoSwitchDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoSwitch';
  final String detail = '''An iOS-style switch.
Used to toggle the on/off state of a single setting.
The switch itself does not maintain any state. Instead, when the state of the switch changes, the widget calls the onChanged callback. Most widgets that use a switch will listen for the onChanged callback and rebuild the switch with a new value to update the visual appearance of the switch.''';

  @override
  _CupertinoSwitchDemoState createState() =>
      _CupertinoSwitchDemoState();
}

class _CupertinoSwitchDemoState
    extends ExampleState<CupertinoSwitchDemo> {
  CupertinoSwitchSetting setting;

  @override
  void initState() {
    setting = CupertinoSwitchSetting(
      value: boolValues[0],
      activeColor: Value(
        value: CupertinoColors.activeGreen,
        label: 'CupertinoColors.activeGreen',
      ),
      onChanged: Value(
          name: 'onChanged',
          value: (value) {
            setState(() {
              setting = setting.copyWith(value: boolValues[value ? 1 : 0]);
            });
          },
          label: '''(value) {
              setState(() {
                _value=value;
              });
            }'''),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''bool _value=false;
  CupertinoSwitch(
      value: ${setting.value?.label??''},
      onChanged: ${setting.onChanged?.label??''},
      activeColor: ${setting.activeColor?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kActiveColor),
      ColorGroupWidget(setting.activeColor, (value) {
        setState(() {
          setting = setting.copyWith(activeColor: value);
        });
      }),
      SwitchValueTitleWidget(
        value: setting.value,
        title: StringParams.kValue,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(value: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoSwitch';
  }


  @override
  Widget getWidget() {
    return Center(
      child: CupertinoSwitch(
        value: setting.value?.value,
        onChanged: setting.onChanged?.value,
        activeColor: setting.activeColor?.value,
      ),
    );
  }
}

class CupertinoSwitchSetting {
  final Value<bool> value;
  final Value<ValueChanged<bool>> onChanged;
  final Value<Color> activeColor;
  CupertinoSwitchSetting({
    this.value,
    this.onChanged,
    this.activeColor,
  });

  CupertinoSwitchSetting copyWith({
    Value<bool> value,
    Value<ValueChanged<bool>> onChanged,
    Value<Color> activeColor,
  }) {
    return CupertinoSwitchSetting(
      value: value ?? this.value,
      onChanged: onChanged ?? this.onChanged,
      activeColor: activeColor ?? this.activeColor,
    );
  }
}
