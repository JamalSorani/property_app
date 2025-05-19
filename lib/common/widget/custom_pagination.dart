// 🌎 Project imports:
import '../imports/imports.dart';

class CustomPagination extends StatelessWidget {
  const CustomPagination({
    super.key,
    required this.totalItemsCount,
    required this.currentPageIndex,
    required this.setSelectedPage,
    required this.currentPageSize,
  });
  final int totalItemsCount;
  final int currentPageIndex;
  final Function setSelectedPage;
  final int currentPageSize;
  int _getNumOfPages(int itemsCount) {
    int num = itemsCount ~/ currentPageSize;
    if (itemsCount % currentPageSize != 0) {
      num++;
    }
    return num;
  }

  @override
  Widget build(BuildContext context) {
    int numOfPages = _getNumOfPages(totalItemsCount);
    return Container(
      width: context.screenWidth,
      height: 46.h,
      margin: REdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: currentPageIndex > 1
                  ? () => setSelectedPage(currentPageIndex - 1)
                  : null,
              child: Icon(
                Icons.arrow_back,
                color: currentPageIndex == 1 ? AppColors.grey : Colors.black,
                size: 14.h,
              ),
            ),
          ),
          BuildPaginationNumbers(
            pageIndex: currentPageIndex,
            numOfPages: numOfPages,
            setSelectedPage: setSelectedPage,
            maxVisiblePages: _calculateMaxVisiblePages(context),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: currentPageIndex < numOfPages
                  ? () => setSelectedPage(currentPageIndex + 1)
                  : null,
              child: Icon(
                Icons.arrow_forward,
                color: currentPageIndex == numOfPages
                    ? AppColors.grey
                    : Colors.black,
                size: 14.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _calculateMaxVisiblePages(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      return 5; // Wider screens show 5 page numbers
    } else if (screenWidth > 400) {
      return 3; // Medium screens show 3 page numbers
    } else {
      return 2; // Smaller screens show 2 page numbers
    }
  }
}

class BuildPaginationNumbers extends StatelessWidget {
  final int pageIndex;
  final int numOfPages;
  final int maxVisiblePages;
  final Function setSelectedPage;

  BuildPaginationNumbers({
    super.key,
    required this.pageIndex,
    required this.numOfPages,
    required this.setSelectedPage,
    required this.maxVisiblePages,
  });

  final dots = Padding(
    padding: REdgeInsets.symmetric(horizontal: 4),
    child: const Text(
      "...",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  List<Widget> _buildPageNumbers() {
    List<Widget> pageNumbers = [];
    // If the total pages are 5 or fewer, show all pages directly
    if (numOfPages <= 5) {
      for (int i = 1; i <= numOfPages; i++) {
        pageNumbers.add(_buildPageButton(i));
      }
      return pageNumbers;
    }
    int halfRange = (maxVisiblePages / 2).ceil();
    int startPage =
        (pageIndex - halfRange).clamp(1, numOfPages - maxVisiblePages + 1);
    startPage = startPage < 1 ? 1 : startPage; // Ensure startPage is at least 1

    int endPage =
        (startPage + maxVisiblePages - 1).clamp(startPage, numOfPages);
    endPage = endPage > numOfPages
        ? numOfPages
        : endPage; // Ensure endPage is at most numOfPages

    // First page labelLarge
    if (startPage > 1) {
      pageNumbers.add(_buildPageButton(1));
      if (startPage > 2) {
        pageNumbers.add(dots);
      }
    }
    // If on a small screen, adjust logic to show current and next indices
    if (maxVisiblePages == 2) {
      startPage = pageIndex;
      endPage = (pageIndex + 1).clamp(pageIndex, numOfPages);
    }

    // Dynamic page buttons
    for (int i = startPage; i <= endPage; i++) {
      pageNumbers.add(_buildPageButton(i));
    }

    // Last page labelLarge
    if (endPage < numOfPages) {
      if (endPage < numOfPages - 1) {
        pageNumbers.add(dots);
      }
      pageNumbers.add(_buildPageButton(numOfPages));
    }

    return pageNumbers;
  }

  Widget _buildPageButton(int index) {
    return GestureDetector(
      onTap: () {
        if (pageIndex != index) setSelectedPage(index);
      },
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 4.0),
        padding: REdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: pageIndex == index
              ? const Color(0xFFEA5455).withOpacity(0.16)
              : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          '$index',
          style: pageIndex == index
              ? TextStyle(
                  color: const Color(0xFFD8181F),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                )
              : TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageNumbers(),
    );
  }
}
