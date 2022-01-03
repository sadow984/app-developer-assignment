import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/controller/home_screen_controller.dart';
import 'package:project/widgets/home_page_header.dart';
import 'package:project/widgets/home_page_header_info.dart';
import 'package:project/widgets/recommended_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeScreenController _screenController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Flyingwolf",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _screenController.scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HomePageHeader(),
              SizedBox(height: 16),
              HeaderPageInfo(),
              SizedBox(height: 16),
              Text("Recommended for you", textScaleFactor: 1.5,),
              SizedBox(height: 16),
              GetBuilder<HomeScreenController>(
                init: _screenController,
                builder: (_) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _screenController.isLoading.value &&
                            _.recommendedList.length == 0
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _.recommendedList.length,
                            itemBuilder: (context, index) {
                              return RecommendedCard(
                                  coverUrl: _.recommendedList[index].coverUrl,
                                  name: _.recommendedList[index].name,
                                  gameName: _.recommendedList[index].gameName);
                            },
                            shrinkWrap: true,
                          ),
                    _screenController.isLoading.value &&
                            _.recommendedList.length != 0
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
