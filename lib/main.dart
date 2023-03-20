import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hvart_har_du_sett/screens/settings_page/settings_page_widget.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initFirebase();

  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  //late Stream<HvARTHarDuSettFirebaseUser> userStream;
  //HvARTHarDuSettFirebaseUser? initialUser;
  bool displaySplashImage = true;

  //final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    /*userStream = hvARTHarDuSettFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    jwtTokenStream.listen((_) {});*/
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    //authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HvART har du sett',
        localizationsDelegates: [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: _themeMode,
        home: /*initialUser == null || */ displaySplashImage
            ? Builder(
                builder: (context) => Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Medical_ScheduleApp_0.0.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              )
            : /*currentUser!.loggedIn
              ? */
            NavBarPage()
        //: LoginPageWidget(),
        );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'mapPage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'mapPage': MapPageWidget(),
      'settingsPage': SettingsPageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        unselectedItemColor: FlutterFlowTheme.of(context).grayLight,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map_outlined,
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.map_outlined,
              size: 24.0,
            ),
            label: '•',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.settings,
              size: 24.0,
            ),
            label: '•',
            tooltip: '',
          ),
        ],
      ),
    );
  }
}
