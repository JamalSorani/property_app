// 🎯 Dart imports:

// 📦 Package imports:
import 'package:image_picker/image_picker.dart';

// 🌎 Project imports:
import '../imports/imports.dart';
import '../utils/extensions/general.dart';
import 'custom_network_image.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.onRemove,
    required this.onImageSelected,
    this.photo,
  });

  final void Function() onRemove;
  final void Function(String image) onImageSelected;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (ctx) => Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("الملف الشخصي"),
                    InkWell(
                      onTap: onRemove,
                      child: const Icon(
                        Icons.delete_outline,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          var image = await picker.pickImage(
                              source: ImageSource.camera);

                          if (image != null && context.mounted) {
                            onImageSelected(image.path);
                          }
                        },
                        icon: const Icon(Icons.camera_alt_outlined),
                        label: const Text("الكاميرا"),
                      ),
                    ),
                    SizedBox(
                      width: 8.r,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          var image = await picker.pickImage(
                              source: ImageSource.gallery);

                          if (image != null && context.mounted) {
                            onImageSelected(image.path);
                          }
                        },
                        icon: const Icon(Icons.photo_camera_back),
                        label: const Text("المعرض"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        width: 120.r,
        height: 120.r,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary)),
        child: Builder(builder: (context) {
          String image = photo ?? "";
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CustomNetworkImage(
              imageUrl: image.toUrl(),
              fit: BoxFit.cover,
            ),
          );
        }),
      ),
    );
  }
}
