import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YoutubePlayerController _controller;
  final ScrollController listcontroller = ScrollController();
  PageController pageController = PageController(initialPage: 0);
  int pageChange = 0;
  int listPosition = 1;
  final double _height = 100.0;
  final _pageController2 = PageController();
  final _currentPageNotifier2 = ValueNotifier<int>(0);

  // Wheater to loop through elements
  bool _loop = true;

  // Scroll controller for carousel
  late InfiniteScrollController _scrollController;

  // Maintain current index of carousel
  int _selectedIndex = 0;

  // Width of each item
  double? _itemExtent;

  // Get screen width of viewport.
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _itemExtent = screenWidth;
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    _scrollController = InfiniteScrollController(initialItem: _selectedIndex);
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: 'JBajCwwaksc',
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: true,
          enableCaption: true,
        ))
      ..addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("Vedic Science")],
        ),
        // ignore: prefer_const_literals_to_create_immutables
        leading: Row(
          children: const [
            SizedBox(
              width: 20,
            ),
            Icon(Icons.menu_open)
          ],
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.notification_add),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.orange,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/splash.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    muteIcon(),
                    videoPlayer(),
                    const SizedBox(
                      height: 10,
                    ),
                    viewMoreButton(),
                    const SizedBox(
                      height: 33,
                    ),
                    stackOverLay(),
                    const SizedBox(
                      height: 30,
                    ),
                    vedicType(),
                    const SizedBox(
                      height: 20,
                    ),
                    buttonMeditation(),
                    const SizedBox(
                      height: 20,
                    ),
                    bottomVideoList(),
                    viewMoreButton(),
                    const SizedBox(
                      height: 5,
                    ),
                    messageIcon(),
                    const SizedBox(
                      height: 5,
                    ),
                    bookIconWithText(),
                    divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    bookList(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget muteIcon() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(right: 15, top: 5, bottom: 5),
        alignment: Alignment.topRight,
        child: Icon(
          Icons.volume_off,
          color: Colors.white,
        ));
  }

  Widget videoPlayer() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
        ),
      ),
    );
  }

  Widget viewMoreButton() {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: const Center(
        child: const Text(
          "View More",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget stackOverLay() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white)),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              songList(),
              buildCircleIndicator()
            ],
          ),
        ),
        Positioned(
          top: -15,
          right: MediaQuery.of(context).size.width / 4,
          left: MediaQuery.of(context).size.width / 4,
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/gurubani_1.png'),
                  fit: BoxFit.cover),
              // color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 12.0,
                  spreadRadius: 1.0,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
            alignment: Alignment.center,
            width: 30,
            height: 30,
            child: Text(
              'Waheguru',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ),
      ],
    ); // return Stack(
  }

  final PageController _pageControllerSong = PageController(initialPage: 0);
  int _selectedTabIndexSong = 0;

  Widget songList() {
    return Container(
      height: 120,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (_selectedTabIndexSong != 0) {
                _selectedTabIndexSong -= 1;
                _pageControllerSong.animateToPage(_selectedTabIndexSong,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              }
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageControllerSong,
              onPageChanged: (index) {
                _selectedTabIndexSong = index;
              },
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    songView(index),
                    const SizedBox(width: 16),
                    songView(index),
                    const SizedBox(width: 16),
                    songView(index),
                    const SizedBox(width: 16),
                    songView(index),
                  ],
                );
              },
              itemCount: 5,
            ),
          ),
          IconButton(
            onPressed: () {
              if (_selectedTabIndexSong != 5) {
                _selectedTabIndexSong += 1;
                _pageControllerSong.animateToPage(_selectedTabIndexSong,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              }
            },
            icon: const Icon(Icons.arrow_forward,color: Colors.white,),
          ),
        ],
      ),
    );
  }

  buildCircleIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CirclePageIndicator(
        itemCount: 5,
        currentPageNotifier: _currentPageNotifier2,
      ),
    );
  }

  Widget songView(index) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/images/om.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              )),
          Center(
            child: Text(
              'Song $index',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget vedicType() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/yoga.png'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Meditation/Yoga",
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/spritual.png'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Spritual Well- being",
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/astro.png'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Astro Science",
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonMeditation() {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: const Center(
        child: const Text(
          "Mediatation",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget bottomVideoList() {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/om.png'),
                                    fit: BoxFit.cover),
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(10)),
                            height: 180,
                            width: 120,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 180,
                            width: 120,
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/play.png'),
                                        fit: BoxFit.cover),
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(30))),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }

  Widget messageIcon() {
    return Container(
      width: double.infinity,
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(right: 10),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.orange[700]),
        child: const Center(
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget bookIconWithText() {
    return Row(
      children: const [
        SizedBox(
          width: 10,
        ),
        Image(
          image: AssetImage('assets/images/books.png'),
          height: 25,
          width: 25,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "BOOKS",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget divider() {
    return Container(
        width: MediaQuery.of(context).size.width - 20,
        child: const Divider(
          color: Colors.white,
        ));
  }

  final PageController _pageController = PageController(initialPage: 0);
  int _selectedTabIndex = 0;

  Widget bookList() {
    return Container(
      height: 200,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (_selectedTabIndex != 0) {
                _selectedTabIndex -= 1;
                _pageController.animateToPage(_selectedTabIndex,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              }
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                _selectedTabIndex = index;
              },
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    laalKitab(index),
                    const SizedBox(width: 16),
                    laalKitab(index),
                    const SizedBox(width: 16),
                    laalKitab(index),
                  ],
                );
              },
              itemCount: 5,
            ),
          ),
          IconButton(
            onPressed: () {
              if (_selectedTabIndex != 5) {
                _selectedTabIndex += 1;
                _pageController.animateToPage(_selectedTabIndex,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              }
            },
            icon: const Icon(Icons.arrow_forward,color: Colors.white,),
          ),
        ],
      ),
    );
  }

  Widget laalKitab(index) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
              height: 120,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/images/lal-kitab.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              )),
          Center(
            child: Text(
              'Laal Kitab $index',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
