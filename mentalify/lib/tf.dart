import 'package:tflite/tflite.dart';

Future<void> loadModel() async {
  String? res = await Tflite.loadModel(
    model: "assets/model.tflite",
    labels: "assets/labels.txt",
  );
  if (res != null) {
    print(res);
  } else {
    print("Failed to load the model");
  }
}

