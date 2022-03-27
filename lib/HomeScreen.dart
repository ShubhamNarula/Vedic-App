import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

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

  @override
  void initState() {
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

  void _animateToIndex(int index) {
    listcontroller.animateTo(
      index * _height,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
            // ignore: prefer_const_literals_to_create_immutables
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
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
                  // SizedBox(height: 10,),
                  viewMoreButton(),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange[700]),
                        child: const Center(
                          child: const Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),

                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.book_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      Text(
                        "BOOKS",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: const Divider(
                        color: Colors.white,
                      )),
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
            // Center(
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         height: MediaQuery.of(context).size.height * 0.41,
            //       ),
            //       Container(
            //         height: 30,
            //         width: 100,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.white),
            //         child: const Center(child: const Text("Waheguru")),
            //       )
            //     ],
            //   ),
            // ),
          ],
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
      children: [
        Container(
          height: 150,
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white)),
          child: Center(
            child: Row(
              children: [
                // indicatorPager()
              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget vedicType() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: const Center(
                  child: Icon(Icons.mediation_outlined, size: 30),
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
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: const Center(
                  child: Icon(
                    Icons.mediation_outlined,
                    size: 30,
                  ),
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
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: const Center(
                  child: Icon(Icons.mediation_outlined, size: 30),
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

  List<String> _items = [
    "Namanian\n Tu Maan",
    "Nanak Chinta\n Mat Karho",
    "Gur Purai\n Meeri Raakh",
    "Har Jiyo\n Tu",
    "Namanian\n Tu Maan",
    "Nanak Chinta\n Mat Karho",
    "Gur Purai\n Meeri Raakh",
    "Har Jiyo\n Tu",
  ];
  final _pageController = PageController();

  // final _pageController2 = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  // final _currentPageNotifier2 = ValueNotifier<int>(0);
  final _boxHeight = 100.0;

  Widget indicatorPager() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(const Radius.circular(10))),
      height: 200,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          ArrowPageIndicator(
            isJump: false,
            pageController: _pageController,
            currentPageNotifier: _currentPageNotifier,
            leftIcon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 40,
            ),
            rightIcon: const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 40,
            ),
            itemCount: _items.length,
            child: _buildPageView(_pageController, _currentPageNotifier),
          ),
          _buildCircleIndicator2()
        ]
            .map((item) => Padding(
                  child: item,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ))
            .toList(),
      ),
    );
  }

  var lengthItem = 0.0;

  _buildCircleIndicator2() {
    if (_items.length > 4) {
      lengthItem = (_items.length.toDouble() / 4) as double;
    }
    return CirclePageIndicator(
      size: 6.0,
      selectedSize: 6.0,
      itemCount: lengthItem.toInt(),
      currentPageNotifier: _currentPageNotifier,
    );
  }

  _buildPageView(
          PageController pageController, ValueNotifier currentPageNotifier) =>
      Container(
        height: _boxHeight,
        child: PageView.builder(
            itemCount: lengthItem.toInt(),
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                              height: 70,
                              width: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(226, 154, 44, 0.5),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(5))),
                              child: const Icon(
                                Icons.music_note_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const Text("data")
                          ],
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(226, 154, 44, 0.5),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(5))),
                              child: const Icon(
                                Icons.music_note_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const Text("data")
                          ],
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(226, 154, 44, 0.5),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(5))),
                              child: const Icon(
                                Icons.music_note_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const Text("data")
                          ],
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(226, 154, 44, 0.5),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(5))),
                              child: const Icon(
                                Icons.music_note_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const Text("data")
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              );
            },
            onPageChanged: (int index) {
              currentPageNotifier.value = index;
            }),
      );

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
                                    image: AssetImage(
                                        'lib/asset/Dhansikhi-Mobile-Wallpaper-I-Love-Waheguru.jpg'),
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
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.orange),
                              child: const Center(
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
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

  Widget bookList() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (listcontroller.offset.toInt() == 0) {
                listPosition = 0;
              }
              if (listPosition != 0) {
                listPosition--;
                print(listPosition);
                _animateToIndex(listPosition);
              }
            });
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  pageChange = index;
                });
                print(pageChange);
              },
              controller: pageController,
              children: [
                Container(
                  height: 200,
                  // width: 60,
                  child: Container(
                    height: 200,
                    child: ListView.builder(
                        controller: listcontroller,
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          print("index => $index");
                          // listdatachanged = index;
                          return Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      height: 120,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'lib/asset/images.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                print(listPosition);
                if (listcontroller.offset.toInt() == 0) {
                  listPosition = 1;
                }
                if (listPosition != listcontroller.offset.toInt()) {
                  listPosition++;
                  print(listPosition);
                  _animateToIndex(listPosition);
                }
              });
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )),
      ],
    );
  }
}
