import 'package:flutter/material.dart';
import 'package:tuska_dashboard/presentation/components/image_selector/image_selector_presenter.dart';

class ImageSelector extends StatefulWidget {
  const ImageSelector({super.key, this.didGetImage});

  final void Function()? didGetImage;

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  String _imagePath = "";
  final presenter = DefaultImageSelectorPresenter();

  void getImage() async {
    String path = await presenter.getImage();

    setState(() {
      _imagePath = path;
    });

    didGetImage();
  }

  void didGetImage() {
    widget.didGetImage!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: SizedBox(
        height: 320,
        width: 180,
        child: InkWell(
            onTap: () => getImage(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: _imagePath != "",
                  child: Image.network(_imagePath),
                ),
                Expanded(
                  child: Visibility(
                    visible: _imagePath == "",
                    child: const Icon(
                      Icons.image,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
