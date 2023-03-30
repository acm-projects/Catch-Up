import 'package:catch_up/screens/all_groups.dart';
import 'package:catch_up/screens/main_profile.dart';
import 'package:flutter/material.dart';

class ExpandableFAB extends StatefulWidget {
  const ExpandableFAB({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });
  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFAB> createState() => _ExpandableFABState();
}

class _ExpandableFABState extends State<ExpandableFAB> {
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
  }

  void _toggle() {
    setState(() {
      _open = !_open;
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
            // ignore: prefer_const_constructors
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.close,
                // ignore: prefer_const_constructors
                color: Color(0xffD79784),
              ),
            ),
          ),
        ),
      ),
    );
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
            height: 70,
            width: 70,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: _toggle,
                backgroundColor: Color(0xffD79784),
                child: Image.asset(
                  'assets/cream-logo.png',
                  height: 45,
                  width: 45,
                ),
              ),
            ),
          ),
        ),
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
                    'Todays hot topic:',
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
                              return const AllGroups();
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
                              return const AllGroups();
                            })));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          child: Container(
                            width: 142.0,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
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
                              return const AllGroups();
                            })));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          child: Container(
                            width: 142.0,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
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
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: const Offset(0, 10),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage('assets/group1.png'),
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
                        const SizedBox(width: 0),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Color(0xffD79784),
                          child:
                              const Icon(Icons.add, color: Color(0xffEFEDE7)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    height: 260,
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
        floatingActionButton: SizedBox(
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
        ));
  }
}
