import 'package:flutter/material.dart';

class CustomTheme<T> extends InheritedWidget {
  const CustomTheme({
    Key? key,
    required this.child,
    required this.data,
    required this.theme,
  }) : super(key: key, child: child);

  final Widget child;
  final AppThemeManagerState<T> data;
  final T theme;

  @override
  bool updateShouldNotify(CustomTheme<T> oldWidget) => true;
}

class AppThemeManager<T> extends StatefulWidget {
  final Widget child;
  final T theme;
  const AppThemeManager({Key? key, required this.child, required this.theme})
      : super(key: key);

  static AppThemeManagerState<T> of<T>(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CustomTheme<T>>())!.data;
  }

  @override
  AppThemeManagerState<T> createState() => AppThemeManagerState<T>();
}

class AppThemeManagerState<T> extends State<AppThemeManager<T>> {
  late T theme;

  @override
  void initState() {
    super.initState();
    theme = widget.theme;
  }

  void changeTheme(T newTheme) {
    setState(() {
      theme = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTheme<T>(
      data: this,
      theme: widget.theme,
      child: widget.child,
    );
  }
}
