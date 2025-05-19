// 📦 Package imports:

// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';
import '../../../../../common/injection/injection.dart';
import '../../../../../router/router_config.dart';
import '../../bloc/contact_us_bloc.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  static const pagePath = 'contactUs';
  static BeamerBuilder pageBuilder = (context, state, data) {
    return const ContactUs();
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ContactUsBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: ReactiveForm(
            formGroup: ContactUsBloc.form,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('تواصل معنا'),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomReactiveField(
                    title: 'عنوان الرسالة',
                    controller: ContactUsBloc.title,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomReactiveField(
                    title: 'نص الرسالة',
                    controller: ContactUsBloc.message,
                  ),
                  Builder(builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<ContactUsBloc>().add(Send());
                      },
                      child: const Text('إرسال'),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
