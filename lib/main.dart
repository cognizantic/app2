import '/barrel1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await baseurlBuild();
  //final receiveMain = ReceivePort();
  //SendPort? isolateSendPort;
  //await Isolate.spawn(isolateMain, receiveMain.sendPort);

  await checknclear();
  await getcolors();
  String? username = await getUsername();

  runApp(MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            /*backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.hovered)) return Colors.white10;
                return Colors.grey[850]!;
              }),
              foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.hovered)) return Colors.white;
                return Colors.grey[100]!;
              }),*/
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              if (states.contains(WidgetState.hovered)) return 8;
              return 2;
            }),
            textStyle: WidgetStateProperty.all(
              const TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,

            primary: Color(0xFF003739),
            onPrimary: Color(0xFF00BFA6),
            primaryContainer: Color(0xFF003739),
            onPrimaryContainer: Colors.white,

            secondary: Color(0xFF006D6F),
            onSecondary: Colors.black,
            secondaryContainer: Color(0xFF00695C),
            onSecondaryContainer: Colors.white,

            surface: Color(0xFF121212),
            onSurface: Colors.white,
            surfaceContainerLowest: Color(0xFF0D0D0D),
            surfaceContainerLow: Color(0xFF1A1A1A),
            surfaceContainer: Color(0xFF212121),
            surfaceContainerHigh: Color(0xFF2A2A2A),
            surfaceContainerHighest: Color(0xFF333333),

            // Optional:
            //surfaceVariant: Color(0xFF2C2C2C),
            onSurfaceVariant: Color(0xFFDADADA),

            tertiary: Color(0xFFEF5350),
            onTertiary: Colors.white,
            tertiaryContainer: Color(0xFF8E0000),
            onTertiaryContainer: Colors.white,

            error: Color(0xFFFF5252),
            onError: Colors.black,
            errorContainer: Color(0xFFB00020),
            onErrorContainer: Colors.white,

            outline: Color(0xFF9E9E9E),
            outlineVariant: Color(0xFF616161),

            shadow: Color(0xFF000000),
            scrim: Color(0xFF000000),
            surfaceTint: Color(0xFF00BFA6),
            inverseSurface: Color(0xFFE0E0E0),
            onInverseSurface: Color(0xFF1A1A1A),
            inversePrimary: Color(0xFF4DD0E1),

            /*primaryFixed: Color.fromARGB(255, 0, 0, 0),
            primaryFixedDim: Color.fromARGB(255, 0, 0, 0),
            onPrimaryFixed: Color.fromARGB(255, 0, 0, 0),
            onPrimaryFixedVariant: Color.fromARGB(255, 0, 0, 0),
            secondaryFixed: Color.fromARGB(255, 0, 0, 0),
            secondaryFixedDim: Color.fromARGB(255, 0, 0, 0),
            onSecondaryFixed: Color.fromARGB(255, 0, 0, 0),
            onSecondaryFixedVariant: Color.fromARGB(255, 0, 0, 0),
            tertiaryFixed: Color.fromARGB(255, 0, 0, 0),
            tertiaryFixedDim: Color.fromARGB(255, 0, 0, 0),
            onTertiaryFixed: Color.fromARGB(255, 0, 0, 0),
            onTertiaryFixedVariant: Color.fromARGB(255, 0, 0, 0),
            surfaceBright: Color.fromARGB(255, 0, 0, 0),
            surfaceContainerHigh: Color.fromARGB(255, 0, 0, 0),
            surfaceContainerHighest: Color.fromARGB(255, 0, 0, 0),
            surfaceContainerLow: Color.fromARGB(255, 0, 0, 0),
            surfaceContainerLowest: Color.fromARGB(255, 0, 0, 0),
            surfaceDim: Color.fromARGB(255, 0, 0, 0),*/
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              animationDuration: Duration(milliseconds: 300),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                    width: 3,
                    strokeAlign: 1,
                    //style: BorderStyle.solid,color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.hovered)) {
                  return Color(0xFF00BFA6);
                } else {
                  return Color(0xFF003739);
                }
              }),
              foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.hovered)) {
                  return Color(0xFF003739);
                } else {
                  return Color(0xFF00BFA6);
                }
              }),
              elevation: WidgetStateProperty.resolveWith<double>((states) {
                if (states.contains(WidgetState.hovered)) return 10;
                return 2;
              }),
              textStyle: WidgetStateProperty.all(
                const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: Color(0xFF003739),
            hintFadeDuration: Duration(milliseconds: 300),
            hintStyle: TextStyle(
              color: Color(0xFF00BFA6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF00BFA6),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF003739),
              ),
            ),
            //activeIndicatorBorder: BorderSide(color: Color(0xFF00BFA6)),
          ),
          drawerTheme: DrawerThemeData(
            backgroundColor: Color(0xFF121212),
          ),
          navigationDrawerTheme: NavigationDrawerThemeData(
            backgroundColor: Color(0xFF121212),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF121212),
            foregroundColor: Color(0xFF00BFA6),
          )),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: (username == null || username.isEmpty) ? Login() : Signin()));
}
