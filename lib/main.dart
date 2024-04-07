import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
import 'package:wang_hann_exhibition/presentation/Home/about_page.dart';
import 'package:wang_hann_exhibition/presentation/Home/footer.dart';
import 'package:wang_hann_exhibition/presentation/Home/portfolio_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wang_hann_exhibition/presentation/Privacy%20Policy/privacy_policy.dart';
import 'package:wang_hann_exhibition/utils/context_extension.dart';

import 'presentation/Home/service_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  // turn off the # in the URLs on the web
  setPathUrlStrategy();

  runApp(ProviderScope(
    child: InteractiveViewer(
      scaleEnabled: isWebMobile ? true : false,
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wanghann Healthcare Agency 汪翰生醫策展',
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
        fontFamily: 'Noto Sans Tc',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
    this.extra, {
    super.key,
  });

  final String? extra;

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

    return Stack(
      children: [
        Scaffold(
          body: ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) =>
                item(index, itemScrollController, context),
            itemScrollController: itemScrollController,
            //Scroll physics for environments that prevent the scroll offset from reaching beyond the bounds of the content.
            physics: const ClampingScrollPhysics(),
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
