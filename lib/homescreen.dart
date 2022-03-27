import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  // late VideoPlayerController _controller;
  late YoutubePlayerController _controller;
  final ScrollController listcontroller = ScrollController();
  PageController pageController = PageController(initialPage: 0);
  int Pagechanged = 0;
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
      duration: Duration(milliseconds: 200),
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
                  const SizedBox(
                    height: 10,
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  Row(
                    children: const [
                      Spacer(),
                      Icon(
                        Icons.volume_off,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)),
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text(
                        "View More",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  vedicType(),
                  SizedBox(
                    height: 20,
                  ),
                  buttonMeditation(),
                  SizedBox(
                    height: 20,
                  ),

                  bottomVideoList(),
                  // SizedBox(height: 10,),
                  viewmorebutton(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange[700]),
                        child: Center(
                          child: Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
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
                      child: Divider(
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  bookList(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.41,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(child: Text("Waheguru")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewmorebutton() {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Text(
          "View More",
          style: TextStyle(color: Colors.white),
        ),
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
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: const Center(
                  child: Icon(Icons.mediation_outlined, size: 30),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
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
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Center(
                  child: Icon(
                    Icons.mediation_outlined,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
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
                        offset: Offset(0, 3), // changes position of shadow
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
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 200,
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          ArrowPageIndicator(
            isJump: false,
            pageController: _pageController,
            currentPageNotifier: _currentPageNotifier,
            leftIcon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 40,
            ),
            rightIcon: Icon(
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
                  padding: EdgeInsets.symmetric(vertical: 16.0),
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
                                    color: Color.fromRGBO(226, 154, 44, 0.5),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Icon(
                                Icons.music_note_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text("data")
                          ],
                        )),
                        SizedBox(
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
                                    color: Color.fromRGBO(226, 154, 44, 0.5),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Icon(
                                Icons.music_note_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text("data")
                          ],
                        )),
                        SizedBox(
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
                                    color: Color.fromRGBO(226, 154, 44, 0.5),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Icon(
                                Icons.music_note_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text("data")
                          ],
                        )),
                        SizedBox(
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
                                    color: Color.fromRGBO(226, 154, 44, 0.5),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Icon(
                                Icons.music_note_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text("data")
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
      child: Center(
        child: Text(
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
                              child: Center(
                                child: Icon(
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
              if(listcontroller.offset.toInt() == 0){
                listPosition = 0;
              }
                if(listPosition != 0){
                listPosition --;
                print(listPosition);
                _animateToIndex(listPosition);
                }
              });
            },
             
           
            icon: Icon(
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
                  Pagechanged = index;
                });
                print(Pagechanged);
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
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  SizedBox(
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
              if(listcontroller.offset.toInt() == 0){
                listPosition = 1;
              }
                if(listPosition != listcontroller.offset.toInt()){
                listPosition ++;
                print(listPosition);
                _animateToIndex(listPosition);
                }
              });
            },
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )),
      ],
    );
  }
}
