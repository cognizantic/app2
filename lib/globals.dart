import 'barrel1.dart';

late final baseurl;

var status = 0;
late int primary;
late int secondary;
late int accent;

//dark theme
Color darkSurface = Color(0xff001219);
Color darkPrimary = Color(0xff005f73);
Color darkOnPrimary = Color(0xff0a9396);
Color darkOnSurface = Color(0xff94d2bd);
Color darkOnSurfaceVariant = Color.fromARGB(255, 167, 233, 166);
Color dark1 = Color.fromARGB(255, 0, 238, 111);
Color dark2 = Color.fromARGB(255, 0, 130, 61);
Color darkOnError = Color(0xffbb3e03);
Color darkError = Color(0xffae2012);
Color darkErrorContainer = Color(0xff9b2226);
Color darkWhite = Color(0xffffffff);
Color darkBlack = Color(0xff000000);
Color darkTransparent = Color(0x00000000);
//light theme

Future<void> saveUsername(String username) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
}

Future<String?> getUsername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

Future<void> removeUsername() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
}

Future<void> checknclear() async {
  final prefs = await SharedPreferences.getInstance();
  bool shouldClear = prefs.getBool('clearOnNextLaunch') ?? false;

  if (shouldClear) {
    await prefs.remove('username');
    await prefs.setBool('clearOnNextLaunch', false);
  }
}

Future<void> setclearusername(String username) async {
  saveUsername(username);
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('clearOnNextLaunch', true);
}

Future<void> setcolors(int primary, int secondary, int accent) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('primary', primary);
  await prefs.setInt('secondary', secondary);
  await prefs.setInt('accent', accent);
  await getcolors();
}

Future<void> clearcolors() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('primary');
  await prefs.remove('secondary');
  await prefs.remove('accent');
  await getcolors();
}

Future<void> getcolors() async {
  final prefs = await SharedPreferences.getInstance();
  final int? sPrimary = prefs.getInt('primary');
  final int? sSecondary = prefs.getInt('secondary');
  final int? sAccent = prefs.getInt('accent');
  if (sPrimary == null && sSecondary == null && sAccent == null) {
    primary = colorToInt(Colors.black);
    secondary = colorToInt(Colors.grey);
    accent = colorToInt(Colors.purple);
  } else {
    primary = sPrimary as int;
    secondary = sSecondary as int;
    accent = sAccent as int;
  }
}

int colorToInt(Color color) {
  return ((color.a * 255.0).round() << 24) |
      ((color.r * 255.0).round() << 16) |
      ((color.g * 255.0).round() << 8) |
      (color.b * 255.0).round();
}

Color invertColor(Color color) {
  final red = 255 - (color.r * 255.0).round();
  final green = 255 - (color.g * 255.0).round();
  final blue = 255 - (color.b * 255.0).round();
  final alpha = (color.a * 255).round();
  return Color.fromARGB(alpha, red, green, blue);
}

List<String> greetings = [
  // Common global languages
  "Hello", // English
  "Hola", // Spanish
  "Bonjour", // French
  "Hallo", // German / Dutch / Afrikaans / Luxembourgish
  "Ciao", // Italian
  "Olá", // Portuguese
  "Salam", // Arabic / Persian
  "Namaste", // Hindi / Nepali
  "Nǐ hǎo", // Mandarin Chinese
  "Konnichiwa", // Japanese
  "Annyeong", // Korean (casual)
  "Xin chào", // Vietnamese
  "Sawatdee", // Thai
  "Kamusta", // Filipino
  "Merhaba", // Turkish
  "Privet", // Russian (informal)
  "Zdravstvuyte", // Russian (formal)
  "Shalom", // Hebrew
  "Yassas", // Greek
  "Halo", // Indonesian / Javanese
  "Hoi", // Swiss German / Dutch
  "Szia", // Hungarian
  "Dzień dobry", // Polish
  "Tere", // Estonian
  "Labas", // Lithuanian
  "Sveiki", // Latvian
  "Moien", // Luxembourgish
  "Bok", // Croatian
  "Zdravo", // Serbian / Bosnian / Montenegrin
  "Ahoj", // Czech / Slovak
  "Përshëndetje", // Albanian
  "Selamat pagi", // Malay
  "Jambo", // Swahili
  "Habari", // Swahili
  "Sain baina uu", // Mongolian
  "Anyoung haseyo", // Korean (formal)
  "God dag", // Danish / Norwegian / Swedish
  "Hei", // Finnish / Norwegian
  "Helo", // Welsh
  "Dia dhuit", // Irish
  "Haloa", // Hawaiian
  "Kia ora", // Māori (New Zealand)
  "Talofa", // Samoan
  "Fakaalofa atu", // Niuean
  "Mālō e lelei", // Tongan
  "Ia orana", // Tahitian
  "Hola", // Quechua (also same as Spanish)
  "Ola", // Galician
  "Aloha", // Hawaiian

  // Indigenous / less common languages
  "Nnọọ", // Igbo (Nigeria)
  "Bawo ni", // Yoruba (Nigeria)
  "Sanibonani", // Zulu
  "Sawubona", // Zulu (common)
  "Mhoro", // Shona (Zimbabwe)
  "Salibonani", // Ndebele
  "Dumela", // Setswana (Botswana)
  "Halo", // Malagasy (Madagascar)

  // Constructed / fictional languages
  "Saluton", // Esperanto
  "Konbanwa", // Japanese (good evening)
  "Valar morghulis", // High Valyrian (Game of Thrones)
  "Nanu nanu", // Orkan (Mork & Mindy)
  "Live long and prosper", // Vulcan (Star Trek)
  "Elvish: Suilad", // Tolkien's Sindarin
  "Na'vi: Kaltxì", // Na'vi (Avatar)

  // Other
  "Howdy", // Southern US English (informal)
  "Yo", // Slang (informal)
  "Hey", // Casual English
  "Peace", // Urban/hip-hop greeting
];

void startPeroidics() {
  _sendIP();
  Timer.periodic(Duration(minutes: 1), (timer) {
    _sendIP();
  });
}

void _sendIP() async {
  try {
    final response = await post(
      Uri.parse('$baseurl/update-ip'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': await getUsername(),
        'deviceName': Platform.localHostname,
        'deviceIP4': await getIP4(),
        'deviceIP6': await getIP6()
      }),
    );
    status = response.statusCode;
    if (status == 200) {
      //debugPrint('ip sent');
    }
    //return status;
  } catch (e) {
    status = 500;
    //return status;
  }
}

Future<String?> getIP4() async {
  try {
    final client4 = HttpClient();
    final request4 =
        await client4.getUrl(Uri.parse('https://api.ipify.org?format=json'));
    final response4 = await request4.close();
    final body = await response4.transform(utf8.decoder).join();
    final json = jsonDecode(body);
    return json['ip'];
  } catch (e) {
    debugPrint(e as String?);
    return '0.0.0.0';
  }
}

Future<String?> getIP6() async {
  try {
    final client = HttpClient();
    final request =
        await client.getUrl(Uri.parse('https://api64.ipify.org?format=json'));
    final response = await request.close();

    final body = await response.transform(utf8.decoder).join();
    print(body);
    final json = jsonDecode(body);
    print(json);
    return json['ip'];
  } catch (e) {
    debugPrint(e as String?);
    return '::';
  }
}

Future<void> baseurlBuild() async {
  //baseurl = 'http://${await getIP4()}:3443';
  baseurl = 'http://127.0.0.1:3443';
  print(baseurl);
}
