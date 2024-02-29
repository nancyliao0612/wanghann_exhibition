import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:wang_hann_exhibition/presentation/Home/home_video.dart';
import 'package:wang_hann_exhibition/presentation/Home/partner.dart';
import 'package:wang_hann_exhibition/presentation/Home/pc_home_video.dart';
import 'package:wang_hann_exhibition/presentation/Home/pc_testimony_page.dart';
import 'package:wang_hann_exhibition/presentation/Home/testimony_page.dart';
import 'package:wang_hann_exhibition/presentation/Navbar/navbar.dart';
import 'package:wang_hann_exhibition/presentation/Portfolios/abbvie_portfolio.dart';
import 'package:wang_hann_exhibition/presentation/Portfolios/merck_portfolio.dart';
import 'package:wang_hann_exhibition/presentation/Portfolios/taitra_portfolio.dart';
import 'package:wang_hann_exhibition/presentation/Portfolios/tsitc_portfolio.dart';
import 'package:wang_hann_exhibition/presentation/Home/about_pgae.dart';
import 'package:wang_hann_exhibition/presentation/Home/footer.dart';
import 'package:wang_hann_exhibition/presentation/Home/portfolio_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wang_hann_exhibition/presentation/Privacy%20Policy/privacy_policy.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';

import 'presentation/Home/service_page.dart';

void main() {
  // turn off the # in the URLs on the web
  setPathUrlStrategy();
  // ItemScrollController itemScrollController = ItemScrollController();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final ItemScrollController itemScrollController;

  // itemPositionsListener = ItemPositionsListener.create();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// Controller to scroll or jump to a particular item.

    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyHomePage(null),
        '/TSITC': (context) => const TSITCPortfolio(),
        '/AbbVie': (context) => const AbbViePortfolio(),
        '/Merck': (context) => const MerckPortfolio(),
        '/TAITRA': (context) => const TAITRAPortfolio(),
        '/PrivacyPolicy': (context) => const PrivacyPolicy(),
      },
      theme: ThemeData(
        fontFamily: 'Noto Sans',
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
    this.extra, {
    super.key,
    // required this.itemScrollController,
  });

  final String? extra;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final ItemScrollController itemScrollController;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ItemScrollController itemScrollController;

  @override
  void initState() {
    itemScrollController = ItemScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;

    // print('arguments from TSITC: ${args}');
    // if (true) {
    //   itemScrollController.scrollTo(
    //     index: 1,
    //     duration: const Duration(seconds: 2),
    //     curve: Curves.easeInOutCubic,
    //     // alignment: 1.0,
    //   );
    // }

    return Stack(
      children: [
        Scaffold(
          // AppBar(
          //   // TRY THIS: Try changing the color here to a specific color (to
          //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          //   // change color while the other colors stay the same.
          //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   // Here we take the value from the MyHomePage object that was created by
          //   // the App.build method, and use it to set our appbar title.

          //   title: Text(widget.title),
          // ),
          body: ScrollablePositionedList.builder(
            itemCount: 7,
            itemBuilder: (context, index) =>
                item(index, itemScrollController, context),
            itemScrollController: itemScrollController,
            //Scroll physics for environments that prevent the scroll offset from reaching beyond the bounds of the content.
            physics: const ClampingScrollPhysics(),
            // child: Column(
            //   // Column is also a layout widget. It takes a list of children and
            //   // arranges them vertically. By default, it sizes itself to fit its
            //   // children horizontally, and tries to be as tall as its parent.
            //   //
            //   // Column has various properties to control how it sizes itself and
            //   // how it positions its children. Here we use mainAxisAlignment to
            //   // center the children vertically; the main axis here is the vertical
            //   // axis because Columns are vertical (the cross axis would be
            //   // horizontal).
            //   //
            //   // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            //   // action in the IDE, or press "p" in the console), to see the
            //   // wireframe for each widget.
            //   // mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const ServicePage(),
            //     const Partner(),
            //     Testimony(context: context),
            //     const PortfolioPage(),
            //     const AboutPage(),
            //     const Footer()
            //   ],
            // ),
          ),
        ),
        SizedBox(
          height: context.isSmallScreen ? 55 : 59,
          child: Navbar(context, itemScrollController, args),
        ),
      ],
    );
  }

  Widget item(
      int i, ItemScrollController itemScrollController, BuildContext context) {
    switch (i) {
      case 0:
        return context.isSmallScreen
            ? HomeVideo(itemScrollController, context)
            : PCHomeVideo(itemScrollController, context);
      // return const Text('');
      case 1:
        return const ServicePage();
      case 2:
        return const Partner();
      case 3:
        return context.isSmallScreen ? const Testimony() : const PcTestimony();
      case 4:
        return const PortfolioPage();
      case 5:
        return const AboutPage();
      case 6:
        return Footer(itemScrollController);
      default:
        return const Text('');
    }
  }
}
