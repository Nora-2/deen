import 'package:deen/Features/Splash/presesntation/views/splash_view.dart';
import 'package:deen/Features/learn/views/ArkanEmanScreen.dart';
import 'package:deen/Features/learn/views/ArkanIslamScreen.dart';
import 'package:deen/Features/learn/views/DateHegryScreen.dart';
import 'package:deen/Features/learn/views/GhzawatScreen.dart';
import 'package:deen/Features/learn/views/HadethScreen.dart';
import 'package:deen/Features/learn/views/MalaekaScreen.dart';
import 'package:deen/Features/learn/views/ProphetMohamedScreen.dart';
import 'package:deen/Features/learn/views/ProphetMohamedWifesScreen.dart';
import 'package:deen/Features/learn/views/ProphetsScreen.dart';
import 'package:deen/Features/learn/views/SadakaScreen.dart';
import 'package:deen/Features/learn/views/SalahScreen.dart';
import 'package:deen/Features/learn/views/TenOfGanaScreen.dart';
import 'package:deen/Features/learn/views/WdooaScreen.dart';
import 'package:deen/Features/learn/views/namesofallahscreen.dart';
import 'package:deen/Features/learn/views/prophetmohamessons.dart';
import 'package:deen/Features/video/views/akedastories.dart';
import 'package:deen/Features/video/views/animalstories.dart';
import 'package:deen/Features/video/views/ayatstories.dart';
import 'package:deen/Features/video/views/ghzwatstories.dart';
import 'package:deen/Features/video/views/hadithnabwy.dart';
import 'package:deen/Features/video/views/humanstories.dart';
import 'package:deen/Features/video/views/mixstories.dart';
import 'package:deen/Features/video/views/prophetmohamedstories.dart';
import 'package:deen/Features/video/views/prophetsstories.dart';
import 'package:deen/Features/video/views/qurankareem.dart';
import 'package:deen/Features/video/views/womenstories.dart';
import 'package:deen/launcher.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLearnView = '/LearnView';
  static const kQuizView = '/QuizView';
  static const kSplashView = '/SplashView';
  static const kLauncherView = '/LauncherView';
  static const kVideoView = '/videoView';
  static const kArkanEmanScreen = '/ArkanEmanScreen';
  static const kArkanIslamScreen = '/ArkanIslamScreen';
  static const kDateHegryScreen = '/DateHegryScreen';
  static const kGhzawatScreen = '/GhzawatScreen';
  static const kHadethScreen = '/HadethScreen';
  static const kMalaekaScreen = '/MalaekaScreen';
  static const kNamesOfAllahScreen = '/NamesOfAllahScreen';
  static const kProftMohamedSonsScreen = '/ProftMohamedSonsScreen';
  static const kProphetMohamedScreen = '/ProphetMohamedScreen';
  static const kProphetMohamedWifesScreen = '/ProphetMohamedWifesScreen';
  static const kProphetsScreen = '/ProphetsScreen';
  static const kSadakaScreen = '/SadakaScreen';
  static const kSalahScreen = '/SalahScreen';
  static const kTenOfGanaScreen = '/TenOfGanaScreen';
  static const kWdooaScreen = '/WdooaScreen';
  static const akedastories = '/akedastories';
  static const qurankareem = '/qurankareem';
  static const ghzwatstories = '/ghzwatstories';
  static const mixstories = '/mixstories';
  static const prophetmohamed = '/prophetmohamed';
  static const wemonstories = '/wemonstories';
  static const prophetsstories = '/prophetsstories';
  static const ayatstories = '/ayatstories';
  static const humanstories = '/humanstories';
  static const animalstories = '/animalstories';
  static const hadith = "/hadethnabwy";

  static List<String> routes = [
    kArkanEmanScreen,
    kArkanIslamScreen,
    kDateHegryScreen,
    kGhzawatScreen,
    kHadethScreen,
    kMalaekaScreen,
    kProphetsScreen,
    kProphetMohamedScreen,
    kProftMohamedSonsScreen,
    kProphetMohamedWifesScreen,
    kWdooaScreen,
    kSalahScreen,
    kTenOfGanaScreen,
    kSadakaScreen,
    kNamesOfAllahScreen,
  ];
  static List<String> stories = [
    qurankareem,
    hadith,
    akedastories,
    ghzwatstories,
    mixstories,
    prophetmohamed,
    wemonstories,
    prophetsstories,
    ayatstories,
    humanstories,
    animalstories
  ];
  static final router = GoRouter(
    routes: [
      // Splash route with fade transition
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const Splash(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );

              return ScaleTransition(scale: scaleAnimation, child: child);
            },
          );
        },
      ),

      // Launcher route with a fade transition
      GoRoute(
        path: kLauncherView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const LauncherPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );

              return ScaleTransition(scale: scaleAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kProftMohamedSonsScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const ProphetmohamedsonsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Slide from right
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: hadith,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const Hadithnabwyscreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Slide from right
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kArkanEmanScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const ArkanEmanScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Slide from right
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: mixstories,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const MixVideoScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Slide from right
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: akedastories,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const Akedastoriesscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Slide from right
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kArkanIslamScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const ArkanIslamScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kDateHegryScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const DateHegryScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kGhzawatScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const GhzawatScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kHadethScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const HadethScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kMalaekaScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const MalaekaScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),

      GoRoute(
        path: kProftMohamedSonsScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const ProphetmohamedsonsScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kProphetMohamedScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const ProphetMohamed(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kNamesOfAllahScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const Namesofallahscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kProphetMohamedWifesScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const ProphetMohamedWifesScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kProphetsScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const ProphetsScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kSadakaScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const SadakaScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kSalahScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const SalahScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kTenOfGanaScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const TenOfGanaScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: kWdooaScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const WdooaScreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),

      ////////////////
      GoRoute(
        path: qurankareem,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const Qurankareemscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: ghzwatstories,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const Ghzwatstoriesscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: prophetmohamed,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const ProphetMohamedstoriesscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: wemonstories,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const Womenstoriesscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: prophetsstories,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const Prophetstoriesscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: ayatstories,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child: const Ayatstoriesscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: humanstories,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const Humanstoriesscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: animalstories,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            child:
                const AnimalQuranstoriesscreen(), // Replace with your screen widget
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var tween = Tween<Offset>(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
    ],
  );
}
