import 'package:image_picker/image_picker.dart';

abstract class ImageSelectorPresenter {
  Future<String> getImage();
}

class DefaultImageSelectorPresenter implements ImageSelectorPresenter {
  String _imagePath = "";

  @override
  Future<String> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    _imagePath = image!.path;
    return _imagePath;
  }
}
