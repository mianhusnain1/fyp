import 'package:flutter/cupertino.dart';
import '../models/ai_models_model.dart';
import '../services/ai_apis.dart';

class AIModelsProvider with ChangeNotifier {
  String currentModel = "gpt-3.5-turbo-0301";

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<AiModelsModel> modelsList = [];

  List<AiModelsModel> get getModelsList {
    return modelsList;
  }

  Future<List<AiModelsModel>> getAllModels() async {
    modelsList = await ApiService.getModels();
    return modelsList;
  }
}
