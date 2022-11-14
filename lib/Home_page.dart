import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> with TickerProviderStateMixin {
  var backColor = const Color(0xff090e21);
  var backColor2 = const Color(0xff1d1e33);
  var chang = 0;
  var chang2 = 0;
  var Sliderval = 180;
  var Weight = 55;
  var Age = 22;
  var changWeight1 = 1;
  var changWeight2 = 0;
  var changAge1 = 1;
  var changAge2 = 0;

  var Decor = BoxDecoration(
    color: const Color(0xff1d1e33),
    borderRadius: BorderRadius.circular(10),
  );

  late AnimationController animationController;
  late AnimationController HeightanimationController;

  late Animation<Offset> FemaleAnimation;
  late Animation<Offset> MaleAnimation;
  late Animation<Offset> WeightAnimation;
  late Animation<Offset> AgeAnimation;

  late Animation HeightAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1150),
    );

    HeightanimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2850),
    );

    FemaleAnimation = Tween<Offset>(
      begin: const Offset(-1, -1),
      end: Offset.zero,
    ).animate(animationController);

    MaleAnimation = Tween<Offset>(
      begin: const Offset(1, -1),
      end: Offset.zero,
    ).animate(animationController);

    WeightAnimation = Tween<Offset>(
      begin: const Offset(-1, 1),
      end: Offset.zero,
    ).animate(animationController);

    AgeAnimation = Tween<Offset>(
      begin: const Offset(1, 1),
      end: Offset.zero,
    ).animate(animationController);

    HeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 500, end: 260), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 250, end: 260), weight: 1),
    ]).animate(HeightanimationController);

    animationController.forward();
    HeightanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xff090e21),
      ),
      body: Container(
        color: const Color(0xff090e21),
        child: Column(
          children: [
            Expanded(
              flex: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        chang = 1;
                        chang2 = 0;
                      });
                    },
                    child: Ink(
                      child: Container(
                        height: 190,
                        width: 160,
                        child: SlideTransition(
                          position: FemaleAnimation,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.female,
                                size: 100,
                                color: (chang == 1)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: (chang == 1)
                                      ? const Color(0xffeb1555)
                                      : Colors.white,
                                  fontWeight: (chang == 1)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (chang == 1)
                              ? Color(0xff3b3c4d)
                              : Color(0xff1d1e33),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        chang2 = 1;
                        chang = 0;
                      });
                    },
                    child: Ink(
                      child: Container(
                        height: 190,
                        width: 160,
                        child: SlideTransition(
                          position: MaleAnimation,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.male,
                                size: 100,
                                color: (chang2 == 1)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: (chang2 == 1)
                                      ? const Color(0xffeb1555)
                                      : Colors.white,
                                  fontWeight: (chang2 == 1)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (chang2 == 1)
                              ? Color(0xff3b3c4d)
                              : Color(0xff1d1e33),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 33,
              child: Center(
                child: AnimatedBuilder(
                  animation: HeightanimationController,
                  builder: (context, widget) {
                    return Container(
                      height: HeightAnimation.value ,
                      width: HeightAnimation.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(height: 20
                          ),
                          const Text(
                            "HEIGHT",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff626473),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$Sliderval",
                                style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 7),
                              Container(
                                height: 100,
                                alignment: const Alignment(0, 0.2),
                                child: const Text(
                                  "cm",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff626473),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: Sliderval.toDouble(),
                            onChanged: (val) {
                              setState(() {
                                Sliderval = val.toInt();
                              });
                            },
                            thumbColor: const Color(0xffeb1555),
                            activeColor: const Color(0xff5c1d1),
                            inactiveColor: const Color(0xff555555),
                            max: 270,
                            min: 90,
                          )
                        ],
                      ),
                      decoration: Decor,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 180,
                    width: 160,
                    decoration: Decor,
                    child: SlideTransition(
                      position: WeightAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "$Weight",
                            style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Weight--;
                                    changWeight1 = 1;
                                    changWeight2 = 0;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: (changWeight1 == 1)
                                            ? Color(0xff67fa4)
                                            : Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (changWeight1 == 1)
                                          ? Color(0xff6e6f7a)
                                          : Color(0xff4c4f5e),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 2),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Weight++;
                                    changWeight2 = 1;
                                    changWeight1 = 0;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: (changWeight2 == 1)
                                          ? Color(0xfff67fa4)
                                          : Colors.white,
                                    ),
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (changWeight2 == 1)
                                          ? Color(0xff6e6f7a)
                                          : Color(0xff4c4f5e),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 160,
                    decoration: Decor,
                    child: SlideTransition(
                      position: AgeAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "$Age",
                            style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Age--;
                                    changWeight1 = 1;
                                    changWeight2 = 0;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: (changAge1 == 1)
                                            ? Color(0xff67fa4)
                                            : Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (changAge1 == 1)
                                          ? Color(0xff6e6f7a)
                                          : Color(0xff4c4f5e),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Age++;
                                    changAge2 = 1;
                                    changAge1 = 0;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: (changAge2 == 1)
                                          ? Color(0xfff67fa4)
                                          : Colors.white,
                                    ),
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (changAge2 == 1)
                                          ? Color(0xff6e6f7a)
                                          : Color(0xff4c4f5e),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffeb1555),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}