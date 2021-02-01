part of configuration;

void generateRoute(
    Map<String, WidgetBuilder> builders, RouteSettings settings) {
  LoginRoute().build(builders, settings);
  HomeRoute().build(builders, settings);
  ChampsRoute().build(builders, settings);
  ChampRoute().build(builders, settings);
  SearchRoute().build(builders, settings);
  SkillRoute().build(builders, settings);
  SkinRoute().build(builders, settings);
  SplashRoute().build(builders, settings);
}

MaterialPageRoute manifest(RouteSettings settings) {
  final routeBuilders = <String, WidgetBuilder>{};
  generateRoute(routeBuilders, settings);
  final Widget Function(BuildContext context) routeBuilder =
      routeBuilders[settings.name];
  return MaterialPageRoute(
      builder: (context) => routeBuilder(context),
      settings: RouteSettings(name: settings.name));
}
