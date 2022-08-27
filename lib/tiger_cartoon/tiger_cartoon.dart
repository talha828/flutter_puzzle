import 'package:abc_puzzles/model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TigerCartoon extends StatefulWidget {
  @override
  State<TigerCartoon> createState() => _TigerCartoonState();
}

class _TigerCartoonState extends State<TigerCartoon> {
  List<ImageModel> list = [
    ImageModel(image: "assets/tiger/crop/1.png", index: 1),
    ImageModel(image: "assets/tiger/crop/2.png", index: 2),
    ImageModel(image: "assets/tiger/crop/3.png", index: 3),
    ImageModel(image: "assets/tiger/crop/4.png", index: 4),
    ImageModel(image: "assets/tiger/crop/5.png", index: 5),
    ImageModel(image: "assets/tiger/crop/6.png", index: 6),
    ImageModel(image: "assets/tiger/crop/7.png", index: 7),
    ImageModel(image: "assets/tiger/crop/8.png", index: 8),
    ImageModel(image: "assets/tiger/crop/9.png", index: 9),
    ImageModel(image: "assets/tiger/crop/10.png", index: 10),
    ImageModel(image: "assets/tiger/crop/11.png", index: 11),
    ImageModel(image: "assets/tiger/crop/12.png", index: 12),
  ];
  List<ImageModel> list3 = [
    ImageModel(image: "assets/tiger/crop/1.png", index: 1),
    ImageModel(image: "assets/tiger/crop/2.png", index: 2),
    ImageModel(image: "assets/tiger/crop/3.png", index: 3),
    ImageModel(image: "assets/tiger/crop/4.png", index: 4),
    ImageModel(image: "assets/tiger/crop/5.png", index: 5),
    ImageModel(image: "assets/tiger/crop/6.png", index: 6),
    ImageModel(image: "assets/tiger/crop/7.png", index: 7),
    ImageModel(image: "assets/tiger/crop/8.png", index: 8),
    ImageModel(image: "assets/tiger/crop/9.png", index: 9),
    ImageModel(image: "assets/tiger/crop/10.png", index: 10),
    ImageModel(image: "assets/tiger/crop/11.png", index: 11),
    ImageModel(image: "assets/tiger/crop/12.png", index:12),
  ];
  List list2 = [];
  bool animation = false;
  bool show = false;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        animation = true;
      });
    });
    super.initState();
  }
  double start=5;
  double end= 10;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var width = media.width;
    var height = media.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: width,
        height: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/background_image/3.jpg',


                ),
                fit: BoxFit.cover)),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            top: 140,
            child: Container(
              child: Stack(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(),
                  //   child: Image.asset("assets/puzzle/temp.webp",
                  //       width: 400,
                  //       height: 200,
                  //       fit: BoxFit.fill,
                  //       color: Color.fromRGBO(255, 255, 255, 0.3),
                  //       colorBlendMode: BlendMode.modulate),
                  // ),
                  Container(
                    width: 400,
                    height: 210,
                    child: Stack(children: [
                      for (int i = 0; i < list2.length; i++)
                        Container(
                          child: Hero(
                            tag:list2[i],
                            child: Image.asset(
                              "assets/tiger/image/${list2[i]}.png",
                              height: 500,
                              width: 400,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                    ]),
                  ),
                  Container(
                    // color: Colors.amber,
                    child: Image.asset("assets/fram.png",
                        width: 400,
                        height: 210,
                        fit: BoxFit.fill,
                        color: Colors.black),
                  ),
                  Container(
                    width: 400,
                    height: 210,
                    //color: Colors.grey.withOpacity(0.7),
                    child:GridView.count(crossAxisCount: 4,
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      childAspectRatio: 400/280,
                      children: list3.map((e) =>
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == e.index;
                          }, onAccept: (data) {
                            data.index == e.index
                                ? list2.add(data.index)
                                : print(false);
                            data.index == e.index? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                  list.addAll(list3);
                                  list2.clear();
                                  animation = false;
                                  show = false;
                                  setState(() {});
                                  Future.delayed(Duration(seconds: 1), () {
                                    setState(() {
                                      animation = true;
                                    });
                                  });
                                });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return Container(
                              //color: e.index== 6?Colors.amber.withOpacity(0.2):Colors.amber.withOpacity(0.7),
                              child: SizedBox(
                                width: 100,
                                height:70,
                              ),
                            );
                          }),
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //alignment: Alignment.center,
                children: [
                  // Container(
                  //   child: Image.asset("assets/puzzle/10.png",width: 200,height: 400,fit: BoxFit.fill,color: Colors.black,),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 400,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                direction: DismissDirection.vertical,
                                key: UniqueKey(),
                                child: Container(
                                  child: Draggable<ImageModel>(
                                      data: list[index],
                                      feedback: TweenAnimationBuilder(
                                        tween: Tween<double>(begin: 90,end:100 ),
                                        duration: Duration(seconds: 1),
                                        builder: (context,double value,child){
                                          return Container(
                                            // alignment: Alignment.center,
                                            // color: Colors.white,
                                            width:  90,
                                            height: 90,
                                            child: Container(
                                              child: Hero(
                                                tag: list[index].index,
                                                child: Image.asset(
                                                  list[index].image,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      child: TweenAnimationBuilder(
                                        onEnd: (){
                                          setState(() {
                                            if(start==5.0){
                                              start=10.0;
                                              end=5.0;
                                            }else{
                                              start=5.0;
                                              end=10.0;
                                            }
                                          });
                                        },
                                        tween: Tween<double>(begin: start,end:end ),
                                        duration: Duration(seconds: 2),
                                        builder: (context,double value,child){
                                          return Container(
                                            //margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                                            padding: EdgeInsets.symmetric(horizontal: value ,vertical: value),
                                            //color: Colors.grey,
                                            // alignment: Alignment.center,
                                            // color: Colors.white,
                                            width:  90,
                                            height: 90,
                                            child: Container(
                                              child: Image.asset(
                                                list[index].image,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                  ),
                                ),
                              );
                            },
                            itemCount: list.length < 5 ? list.length : 4),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}