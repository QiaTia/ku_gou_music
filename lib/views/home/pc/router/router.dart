import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalRouter extends GetWidget<LocalRouterController> with RouteAware {
  const LocalRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Navigator(
        key: controller._navigatorKey,
        initialRoute: controller._currentRoute.value,
        onGenerateRoute: (settings) {
          final builder = controller._routeMap.value[settings.name];
          if (builder != null) {
            return MaterialPageRoute(builder: builder, settings: settings);
          }
          return null;
        },
      ),
    );
  }

}

class LocalRouterController extends GetxController {
  final String initialRoute;
  final Map<String, WidgetBuilder> routes;
  final RxString _currentRoute = RxString('');
  final Rx<Map<String, WidgetBuilder>> _routeMap = Rx({});
  List<String> openRouteList = [];
  final _navigatorKey = GlobalKey<NavigatorState>();
  String get currentRoute => _currentRoute.value;
  RxBool canBack = false.obs;

  LocalRouterController({this.initialRoute = '', required this.routes}) {
    _currentRoute.value = initialRoute;
    _routeMap.value = routes;
    openRouteList.add(initialRoute);
  }

  bool navigateTo(String name, [dynamic arguments]) {
    if (name == _currentRoute.value) return false;
    if (_routeMap.value.containsKey(name) && currentPage != null) {
      _currentRoute.value = name;
      _navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: currentPage!,
          settings: RouteSettings(name: name, arguments: arguments),
        ),
      );
      openRouteList.add(name);
      canBack.value = _navigatorKey.currentState?.canPop() ?? false;
      return true;
    }
    return false;
  }

  void goBack() {
    if (_navigatorKey.currentState?.canPop() ?? false) {
      _navigatorKey.currentState?.pop();
      openRouteList.removeLast();
      _currentRoute.value = openRouteList.last;
      canBack.value = _navigatorKey.currentState?.canPop() ?? false;
    }
  }

  WidgetBuilder? get currentPage => _routeMap.value[currentRoute];
}
