import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_expedition_travel_challenge/leopard_page.dart';
import 'package:sy_expedition_travel_challenge/styles.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page;
      notifyListeners();
    });
  }

  double get offset => _offset;

  double get page => _page;
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => PageOffsetNotifier(_pageController),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              PageView(
                controller: _pageController,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  LeopardPage(),
                  VulturePage(),
                ],
              ),
              AppBar(),
              LeopardImage(),
              VultureImage(),
              ShareButton(),
              PageIndicator(),
              ArrowIcon(),
              TravelDetailsLabel(),
              StartCampLabel(),
              StartTimeLabel(),
              BaseCampLabel(),
              BaseTimeLabel(),
              DistanceLabel(),
              TravelDots(),
              MapButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class VultureImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          left:
              1.2 * MediaQuery.of(context).size.width - 0.85 * notifier.offset,
          child: child,
        );
      },
      child: IgnorePointer(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90.0),
          child: Image.asset(
            'assets/vulture.png',
            height: MediaQuery.of(context).size.height / 3,
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Row(
          children: <Widget>[
            Text(
              'SY',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Spacer(),
            Icon(Icons.menu),
          ],
        ),
      ),
    );
  }
}

class ArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 128.0 + 400 + 32 - 4,
      right: 24,
      child: Icon(
        Icons.keyboard_arrow_up,
        size: 28,
        color: lighterGrey,
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, _) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: notifier.page.round() == 0 ? white : lightGrey,
                  ),
                  height: 6,
                  width: 6,
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: notifier.page.round() != 0 ? white : lightGrey,
                  ),
                  height: 6,
                  width: 6,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24,
      bottom: 16,
      child: Icon(Icons.share),
    );
  }
}

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: VultureCircle(),
    );
  }
}

class TravelDetailsLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          top: 128.0 + 400 + 32 - 4,
          left: 24 + MediaQuery.of(context).size.width - notifier.offset,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: Text(
        'Travel details',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class StartCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Start camp',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class StartTimeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32 + 40,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          '02:40 pm',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w300, color: lighterGrey),
        ),
      ),
    );
  }
}

class BaseCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Base camp',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class BaseTimeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32 + 40,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '07:30 am',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: lighterGrey,
          ),
        ),
      ),
    );
  }
}

class DistanceLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32 + 40,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Center(
        child: Text(
          '72 km',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
    );
  }
}

class MapButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 8,
      bottom: 0,
      child: Consumer<PageOffsetNotifier>(
        builder: (context, notifier, child) {
          double opacity = math.max(0, 4 * notifier.page - 3);
          return Opacity(
            opacity: opacity,
            child: child,
          );
        },
        child: FlatButton(
          child: Text(
            'ON MAP',
            style: TextStyle(fontSize: 12),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class VultureCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double multiplier = math.max(0, 4 * notifier.page - 3);
        double size = MediaQuery.of(context).size.width * 0.5 * multiplier;
        return Container(
          margin: const EdgeInsets.only(bottom: 250),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightGrey,
          ),
          width: size,
          height: size,
        );
      },
    );
  }
}

class TravelDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32 + 4,
          left: 0,
          right: 0,
          child: Center(
            child: Opacity(
              opacity: opacity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: opacity * 40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: white,
                    ),
                    height: 8,
                    width: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: opacity * 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGrey,
                    ),
                    height: 4,
                    width: 4,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: opacity * 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGrey,
                    ),
                    height: 4,
                    width: 4,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: opacity * 40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: white),
                    ),
                    height: 8,
                    width: 8,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
