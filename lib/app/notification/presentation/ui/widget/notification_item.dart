// ignore_for_file: public_member_api_docs, sort_constructors_first

// 🌎 Project imports:
import 'package:template_app/common/imports/imports.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.body,
    required this.dateCreated,
  });

  final String title;
  final String body;
  final DateTime dateCreated;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black,
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          children: [
            Text(title),
            SizedBox(
              height: 5.h,
            ),
            Text(body),
            Text('$dateCreated'),
          ],
        ),
      ),
    );
  }
}
