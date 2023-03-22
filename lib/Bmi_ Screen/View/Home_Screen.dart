import 'dart:math';

import 'package:bmi_calculater/Bmi_%20Screen/Controller/Home_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen>
    with TickerProviderStateMixin {
  Home_controller home_controller = Get.put(Home_controller());
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI CALCULATOR"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                TweenAnimationBuilder(
                  tween: Tween(
                      begin: const Offset(-500, -500), end: const Offset(0, 0)),
                  duration: Duration(seconds: 2),
                  builder: (context, Offset value, child) =>
                      Transform.translate(
                    offset: value,
                    child: InkWell(
                      onTap: () {
                        home_controller.ismale.value = true;
                      },
                      child: Expanded(
                        child: Container(
                          height: 150,
                          width: 130,
                          color: Colors.black12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(
                                () => Icon(
                                  Icons.male,
                                  size: 70,
                                  color: home_controller.ismale == true
                                      ? Colors.teal
                                      : Colors.black12,
                                ),
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                TweenAnimationBuilder(
                  tween: Tween(
                    begin: const Offset(500, -500),
                    end: const Offset(0, 0),
                  ),
                  duration: Duration(seconds: 2),
                  builder: (context, Offset value, child) =>
                      Transform.translate(
                    offset: value,
                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          home_controller.ismale.value = false;
                        },
                        child: Expanded(
                          child: Container(
                            height: 150,
                            width: 130,
                            color: Colors.black12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(
                                  () => Icon(
                                    Icons.female,
                                    size: 70,
                                    color: home_controller.ismale == false
                                        ? Colors.teal
                                        : Colors.black12,
                                  ),
                                ),
                                Text(
                                  "female",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TweenAnimationBuilder(
              tween: Tween(
                begin: Offset(0, -300),
                end: Offset(0, 0),
              ),
              duration: Duration(seconds: 2),
              builder: (context, Offset value, child) => Transform.translate(
                offset: value,
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(color: Colors.black12),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("HEIGHT"),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${home_controller.i.value.toStringAsFixed(0)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                              Text("cm")
                            ],
                          ),
                        ),
                        Obx(
                          () => Slider(
                            value: home_controller.i.value,
                            onChanged: (value) {
                              home_controller.i.value = value;
                            },
                            max: 200,
                            divisions: 200,
                            min: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                TweenAnimationBuilder(
                  tween: Tween(
                    begin: Offset(-300, 300),
                    end: Offset(0, 0),
                  ),
                  duration: Duration(seconds: 2),
                  builder: (context, Offset value, child) =>
                      Transform.translate(
                    offset: value,
                    child: Container(
                      height: 150,
                      width: 130,
                      color: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() => Text(
                                "${home_controller.weight.value}",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onLongPress: () {
                                  home_controller.weight.value++;
                                },
                                onTap: () {
                                  home_controller.weight.value++;
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        shape: BoxShape.circle),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.add)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  if (home_controller.weight.value != 1) {
                                    home_controller.weight.value--;
                                  }
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        shape: BoxShape.circle),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.remove)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                TweenAnimationBuilder(
                  tween: Tween(
                    begin: Offset(-300, 0),
                    end: Offset(0, 0),
                  ),
                  duration: Duration(seconds: 2),
                  builder: (context, Offset value, child) =>
                      Transform.translate(
                    offset: value,
                    child: Container(
                      height: 150,
                      width: 130,
                      color: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() => Text(
                                "${home_controller.age.value}",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  home_controller.age.value++;
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        shape: BoxShape.circle),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.add)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  if (home_controller.age.value != 1) {
                                    home_controller.age.value--;
                                  }
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        shape: BoxShape.circle),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.remove)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AnimatedBuilder(
              animation: animationController!,
              builder: (context, child) => Transform.rotate(
                angle: animationController!.value * 2 * pi,
                child: child,
              ),
              child: ElevatedButton(
                onPressed: () {
                  home_controller.ans.value = home_controller.weight /
                      ((home_controller.i.value / 100) *
                          (home_controller.i.value / 100));
                },
                child: Text("Calculate"),
              ),
            ),
            Obx(() => Text(
                  "${home_controller.ismale.value ? "Male" : "Female"}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            TweenAnimationBuilder(
              tween: Tween(
                begin: Offset(-0, 500),
                end: Offset(0, 0),
              ),
              duration: Duration(seconds: 2),
              builder: (context, Offset value, child) => Transform.translate(
                offset: value,
                child: Obx(
                  () => Text(
                    "${home_controller.ans.value.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
