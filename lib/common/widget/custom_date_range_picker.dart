// 📦 Package imports:

// 🌎 Project imports:
import '../imports/imports.dart';
import '../utils/extensions/date_time_extension.dart';

class CustomeDateRangePicker extends StatefulWidget {
  const CustomeDateRangePicker({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.formGroup,
    required this.onSelectDateRange,
  });
  final String title;
  final String hintText;
  final String controller;
  final FormGroup formGroup;
  final Function? onSelectDateRange;

  @override
  State<CustomeDateRangePicker> createState() => _CustomeDateRangePickerState();
}

class _CustomeDateRangePickerState extends State<CustomeDateRangePicker> {
  DateTimeRange? selectedDateRange;

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: selectedDateRange,
    );

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
        widget.formGroup.control(widget.controller).value = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedDateRange = widget.formGroup.control(widget.controller).value;
    return ReactiveForm(
      formGroup: widget.formGroup,
      child: Padding(
        padding: REdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 4.r),
              child: Text(
                widget.title,
                style: context.textTheme.titleMedium!
                    .copyWith(color: AppColors.black),
              ),
            ),
            SizedBox(height: 2.h),
            InkWell(
              onTap: () => _selectDateRange(),
              child: Container(
                height: 44,
                width: context.screenWidth,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.15),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    horizontalSpace(16),
                    selectedDateRange != null
                        ? Expanded(
                            child: Row(
                              children: [
                                Text(
                                  selectedDateRange!.formatDateRange(),
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: const Color(0xFF4B465C),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedDateRange = null;
                                      widget.formGroup
                                          .control(widget.controller)
                                          .value = null;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 22.h,
                                    color: const Color(0xff1D1B20),
                                  ),
                                ),
                                horizontalSpace(4),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    if (selectedDateRange == null)
                      Expanded(
                        child: Text(
                          widget.hintText,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xFF4B465C).withOpacity(0.5),
                          ),
                        ),
                      ),
                    Icon(
                      Icons.date_range_outlined,
                      color: Colors.black,
                      size: 24.h,
                    ),
                    horizontalSpace(14),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
