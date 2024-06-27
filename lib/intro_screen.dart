import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';

class IntroScreenData {
  final String title;
  final String description;
  final String imagePath;

  IntroScreenData(
      {required this.title,
      required this.description,
      required this.imagePath});
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final List<IntroScreenData> _introData = [
    IntroScreenData(
      title: 'Welcome to GoalMate',
      description:
          'Stay ahead of the game with real-time scores, match updates, and in-depth statistics. Your ultimate companion for all things football.',
      imagePath: 'assets/intro_screens/Intro(1).jpg',
    ),
    IntroScreenData(
      title: 'Live Scores & Updates',
      description:
          'Never miss a moment! Receive instant notifications for goals, cards, and key match events as they happen.',
      imagePath: 'assets/intro_screens/Intro(2).jpg',
    ),
    IntroScreenData(
      title: 'Ready to Kick Off?',
      description:
          "You're all set to dive into the world of football. Start exploring live scores, news, and more!",
      imagePath: 'assets/intro_screens/Intro(3).jpg',
    ),
  ];

  int _currentPage = 0;

  void _onNextPage() {
    if (_currentPage < _introData.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onPreviousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
void _goToHomeScreen(){
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) =>  HomePage(),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _introData.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _buildPageContent(_introData[index]);
              },
            ),
          ),
          // _buildPageIndicator(),
          // _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildPageContent(IntroScreenData data) {
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              data.imagePath,
              fit: BoxFit.cover,
            )),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black
                  .withOpacity(0.5), // Adjust the opacity to your liking
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  data.description,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 80,
            ),
            Container(
              child: _buildNavigationButtons(),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (_currentPage == 1 || _currentPage == 2)
              ? ElevatedButton(
                  onPressed: _onPreviousPage,
                  child: const Text(
                    '<',
                    style: TextStyle(fontSize: 30, color: Colors.indigo),
                  ),
                )
              : const SizedBox.shrink(),
          ElevatedButton(
            onPressed:_currentPage == _introData.length - 1 ? _goToHomeScreen: _onNextPage,
            child: Text(
              _currentPage == _introData.length - 1 ? 'Finish' : '>',
              style: _currentPage != 2
                  ? const TextStyle(fontSize: 30, color: Colors.indigo)
                  : const TextStyle(color: Colors.indigo),
            ),
          ),
        ],
      ),
    );
  }
}
