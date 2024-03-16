// import flutter pkgs
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import project pkgs
import 'package:expense_tracker/widgets/expenses_home_sfw.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(
      const SafeArea(
        child: MaterialApp(
          home: ExpensesHomeScreenSFW(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  });
}

// var kColorScheme = ColorScheme.fromSeed(
//   seedColor: Colors.blue,
// );

// var kDarkColorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 76, 44, 188),
// );

// void main() {
//   runApp(
//     SafeArea(
//       child: MaterialApp(
//         theme: ThemeData().copyWith(
//           colorScheme: kColorScheme,
//           appBarTheme: const AppBarTheme().copyWith(
//             backgroundColor: kColorScheme.onPrimaryContainer,
//             foregroundColor: kColorScheme.primaryContainer,
//           ),
//         ),
//         darkTheme: ThemeData.dark().copyWith(
//           colorScheme: kDarkColorScheme,
//           appBarTheme: const AppBarTheme().copyWith(
//             backgroundColor: kDarkColorScheme.onPrimaryContainer,
//             foregroundColor: kDarkColorScheme.primaryContainer,
//           ),
//         ),
//         // themeMode: ThemeMode.system,
//         home: const ExpensesHomeScreenSFW(),
//         debugShowCheckedModeBanner: false,
//       ),
//     ),
//   );
// }