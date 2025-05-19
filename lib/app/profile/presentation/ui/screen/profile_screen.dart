// 📦 Package imports:
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';

// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';
import '../../../../../common/injection/injection.dart';
import '../../../../../router/router_config.dart';
import '../../state/bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const pagePath = 'profile';
  static BeamerBuilder pageBuilder = (context, state, data) {
    return const ProfileScreen();
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProfileBloc>()..add(GetProfile()),
      child: Scaffold(
        body: SafeArea(
          child: ReactiveForm(
            formGroup: ProfileBloc.form,
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state.status.isLoading()) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.status.isFail()) {}
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Column(
                      children: [
                        CustomReactiveField(
                          title: AppString.firstName,
                          controller: ProfileBloc.firstName,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomReactiveField(
                          title: AppString.lastName,
                          controller: ProfileBloc.lastName,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomReactiveField(
                          title: AppString.email,
                          keyboardType: TextInputType.emailAddress,
                          controller: ProfileBloc.email,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomReactiveField(
                          title: AppString.phoneNumber,
                          keyboardType: TextInputType.phone,
                          controller: ProfileBloc.phoneNumber,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.r),
                              child: Text(
                                AppString.birthdate,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ReactiveDateTimePicker(
                          formControlName: ProfileBloc.birthdate,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ProfileBloc>().add((SaveProfile()));
                          },
                          child: const Text('حفظ'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
