// ignore_for_file: prefer_const_constructors

import 'package:catch_up/screens/all_groups.dart';
import 'package:catch_up/screens/individual_group.dart';
import 'package:catch_up/screens/main_profile.dart';
import 'package:catch_up/screens/videopage.dart';
import 'package:catch_up/screens/voice_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'friends.dart';

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Color(0xffD79784),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
            opacity: _open ? 0.0 : 1.0,
            curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
            duration: const Duration(milliseconds: 250),
            child: SizedBox(
              height: 80,
              width: 80,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    _toggle();
                  },
                  backgroundColor: Color(0xffD79784),
                  child: Image.asset(
                    'assets/cream-logo.png',
                    height: 42,
                    width: 42,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Color(0xffE9CFC3),
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.white,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEFEDE7),
      extendBody: true,
      bottomNavigationBar: const SafeArea(
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Top.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 0,
                ),
                Image.asset(
                  'assets/cream-logo.png',
                  height: 75,
                  width: 75,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Today\'s hot topic:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    fontFamily: 'Poppins',
                    color: Color(0xffEFEDE7),
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                const Text(
                  'Good news',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    shadows: [
                      Shadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          // ignore: use_full_hex_values_for_flutter_colors
                          color: Color(0xff40000000))
                    ],
                    color: Color(0xffE9CFC3),
                  ),
                ),
                const SizedBox(height: 105),
                SizedBox(
                  height: 192.54,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((BuildContext context) {
                            return const IndividualGroup();
                          })));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Container(
                          width: 142.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                            color: Color(0xffE9CFC3),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 25),
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    // border color and width around the profile image
                                    width: 4,
                                    color: Color(0xffD79784),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                    image: AssetImage('assets/group1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 19),
                              const Text(
                                'Group #1',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  color: Color(0xffEFEDE7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((BuildContext context) {
                            return const IndividualGroup();
                          })));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Container(
                          width: 142.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: Color(0xffE9CFC3),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 25),
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    // border color and width around the profile image
                                    width: 4,
                                    color: Color(0xffD79784),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                    image: AssetImage('assets/group1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 19),
                              const Text(
                                'Group #2',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  color: Color(0xffEFEDE7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((BuildContext context) {
                            return const IndividualGroup();
                          })));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Container(
                          width: 142.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: Color(0xffE9CFC3),
                          ),
                          child: SizedBox(
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 25),
                                  Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        // border color and width around the profile image
                                        width: 4,
                                        color: Color(0xffD79784),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: const Offset(0, 10),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage('assets/group1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 19),
                                  const Text(
                                    'Group #3',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      color: Color(0xffEFEDE7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((BuildContext context) {
                            return const AllGroups();
                          })));
                        },
                        backgroundColor: Color(0xffD79784),
                        child: const Icon(Icons.add, color: Color(0xffEFEDE7)),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  height: 220,
                  width: 367,
                  decoration: BoxDecoration(
                      color: Color(0xffB9D3AF),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 10),
                        ),
                      ]),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      SizedBox(height: 40),
                      const Text(
                        'Next Catch Up in...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          color: Color(0xffEFEDE7),
                        ),
                      ),
                      SizedBox(height: 30),
                      const Text(
                        '7:31 hours',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: 'Cartis-Beautyful-serif',
                          color: Color(0xffD79784),
                          shadows: [
                            Shadow(
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                // ignore: use_full_hex_values_for_flutter_colors
                                color: Color(0xff40000000))
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 110.0,
        children: [
          SizedBox(
            height: 55,
            width: 55,
            child: ActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((BuildContext context) {
                  return const VoicePage();
                })));
              },
              icon: const Icon(
                Icons.mic,
                size: 35,
              ),
            ),
          ),
          SizedBox(
            height: 55,
            width: 55,
            child: ActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((BuildContext context) {
                  return const VideoPage(
                    //add filePath after editing
                    filePath: '',
                  );
                })));
              },
              icon: const Icon(
                Icons.camera_alt,
                size: 32,
              ),
            ),
          ),
          SizedBox(
            height: 55,
            width: 55,
            child: ActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((BuildContext context) {
                  return const FriendsPage();
                })));
              },
              icon: const Icon(
                Icons.group,
                size: 33,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* 
SizedBox(
          height: 70,
          width: 70,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((BuildContext context) {
                  return const ProfilePage();
                })));
              },
              backgroundColor: Color(0xffD79784),
              child: Image.asset(
                'assets/cream-logo.png',
                height: 45,
                width: 45,
              ),
            ),
          ),
        )
*/