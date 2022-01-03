import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../models/recommended.dart';

class HomeScreenController extends GetxController {
  List<Tournaments> recommendedList = [];
  ScrollController scrollController = ScrollController();
  String _cursor = "";
  var isLoading = true.obs;

  void onInit() {
    loadInitialData();
    addNewRecommended();
    super.onInit();
  }

  loadInitialData() async {
    try {
      final response = await Dio().get(
          "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all");
      if (response.data != null) {
        // print(response.data);
        final recommended = Recommended.fromJson(response.data);
        recommendedList.addAll(recommended.data.tournaments);
        _cursor = recommended.data.cursor;
        // print(recommendedList);
        isLoading.value = false;
        update();
      }
    } catch (e) {
      print("Exception Error $e");
    }
  }

  addNewRecommended() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        isLoading.value = true;
        update();
        getNextTournaments();
      }
    });
  }

  getNextTournaments() async {
    try {
      final response = await Dio().get(
          "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all&cursor=$_cursor");
      if (response.data != null) {
        final recommended = Recommended.fromJson(response.data);
        recommendedList.addAll(recommended.data.tournaments);
        _cursor = recommended.data.cursor;
        // print("get next called");
      }
        isLoading.value = false;
        update();
    } catch (e) {
      print(e);
    }
  }
}
