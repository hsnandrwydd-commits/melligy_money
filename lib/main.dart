import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MelligyApp());
}

class MelligyApp extends StatelessWidget {
  const MelligyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'فلوس المليجي',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [Locale('ar', 'EG')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0E0E0E), // خلفية سوداء
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37), // اللون الذهبي
          secondary: Color(0xFFD4AF37),
          surface: Color(0xFF1A1A1A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0E0E0E),
          foregroundColor: Color(0xFFD4AF37),
          centerTitle: true,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // بيانات تجريبية بس عشان نشوف الشكل
  double totalIn = 1500.0;
  double totalOut = 400.0;
  double submitted = 1000.0;

  @override
  Widget build(BuildContext context) {
    double net = totalIn - totalOut;
    double diff = net - submitted;

    return Directionality(
      textDirection: TextDirection.rtl, // اتجاه من اليمين للشمال
      child: Scaffold(
        appBar: AppBar(
          title: const Text('فلوس المليجي للتجارة', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: _currentIndex == 0 
            ? _buildHome(net, diff) 
            : const Center(child: Text('الشاشة دي لسه تحت الإنشاء', style: TextStyle(color: Colors.white))),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (val) => setState(() => _currentIndex = val),
          backgroundColor: const Color(0xFF1A1A1A),
          indicatorColor: const Color(0xFFD4AF37).withOpacity(0.3),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'الرئيسية'),
            NavigationDestination(icon: Icon(Icons.receipt_long), label: 'التحصيل'),
            NavigationDestination(icon: Icon(Icons.money_off), label: 'المصروفات'),
            NavigationDestination(icon: Icon(Icons.description), label: 'التقرير'),
          ],
        ),
      ),
    );
  }

  Widget _buildHome(double net, double diff) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)),
            ),
            child: Column(
              children: [
                const Text('صافي التحصيل اليوم', style: TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 10),
                Text('$net ج.م', style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 32, fontWeight: FontWeight.bold)),
                const Divider(color: Colors.white24, height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoCol('إجمالي الداخل', '$totalIn', Colors.greenAccent),
                    _infoCol('إجمالي الخارج', '$totalOut', Colors.redAccent),
                    _infoCol('المُسلم', '$submitted', Colors.blueAccent),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: diff >= 0 ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: diff >= 0 ? Colors.green : Colors.red),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الفرق النهائي', style: TextStyle(color: Colors.white, fontSize: 18)),
                Text('$diff ج.م', style: TextStyle(color: diff >= 0 ? Colors.green : Colors.red, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCol(String title, String value, Color color) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
