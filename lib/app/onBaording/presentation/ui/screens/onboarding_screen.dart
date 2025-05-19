// ignore_for_file: deprecated_member_use

// 🎯 Dart imports:
import "dart:io";

// 🌎 Project imports:
import "package:template_app/app/onBaording/presentation/state/page_index_provider.dart";
import "package:template_app/app/onBaording/presentation/ui/widgets/indicator.dart";
import "package:template_app/app/onBaording/presentation/ui/widgets/next_button.dart";
import "package:template_app/app/onBaording/presentation/ui/widgets/onboarding_bg.dart";
import "package:template_app/app/onBaording/presentation/ui/widgets/page_content.dart";
import "package:template_app/app/onBaording/presentation/ui/widgets/skip_button.dart";
import "package:template_app/common/imports/imports.dart";
import "../../../../../router/router_config.dart";
import "../../../../auth/presentation/ui/screen/login_screen.dart";

class OnBoardingScreen extends StatefulWidget {
  static BeamerBuilder pageBuilder = (context, state, data) {
    return const OnBoardingScreen();
  };

  static const pagePath = "/onbording";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final pageController = PageController();

  List<OnBoardingPageData> pages = [
    OnBoardingPageData(
      title: '',
      description1: '',
      description2: '',
      pic: '',
    ),
    OnBoardingPageData(
      title: '',
      description1: '',
      description2: '',
      pic: '',
    ),
    OnBoardingPageData(
      title: '',
      description1: '',
      description2: '',
      pic: '',
    ),
  ];

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    pageController.addListener(() {
      Provider.of<PageIndexProvider>(context, listen: false)
          .updatePageIndex((pageController.page ?? 0).toInt());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              const OnBoardingBackground(),
              Padding(
                padding: REdgeInsets.all(24),
                child: Column(
                  children: [
                    const SkipButton(),
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        itemBuilder: (context, i) {
                          return PageContent(
                            colorController: false,
                            page: pages[i],
                            pageIndex: i,
                          );
                        },
                        itemCount: pages.length,
                      ),
                    ),
                    Consumer<PageIndexProvider>(
                        builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OnBoardingIndicator(
                            pageIndex: value.pageIndex,
                          ),
                          NextButton(
                            onTap: () {
                              if (value.pageIndex != 2) {
                                pageController.animateToPage(
                                  value.pageIndex + 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                context.beamToNamed(LoginScreen.pagePath);
                              }
                            },
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
