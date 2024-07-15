// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model/chapter_model.dart';
import '../show_epub.dart';

// ignore: must_be_immutable
class ChaptersList extends StatelessWidget {
  List<LocalChapterModel> chapters = [];
  final String bookId;
  final Widget? leadingIcon;
  final Color accentColor;
  final String chapterListTitle;

  ChaptersList(
      {super.key,
      required this.chapters,
      required this.bookId,
      this.leadingIcon,
      required this.accentColor,
      required this.chapterListTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.h,
        backgroundColor: backColor,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(
              Icons.close,
              color: fontColor,
              size: 20.h,
            )),
        centerTitle: true,
        title: Text(
          chapterListTitle,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: accentColor, fontSize: 15.sp),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: whiteColor,
          padding: EdgeInsets.all(10.h),
          child: _buildView(
            list: chapters,
            bookId: bookId,
          ),
        ),
      ),
    );
  }

  Widget _buildView({
    required List<LocalChapterModel> list,
    required String bookId,
  }) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  await bookProgress.setCurrentChapterIndex(bookId, i);
                  Navigator.of(context).pop(true);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: (list[i].isSubChapters ?? false) ? 15.w : 0.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      Text(list[i].Title ?? '',
                          style: TextStyle(
                              color: fontColor,
                              fontFamily: fontNames
                                  .where((element) => element == selectedFont)
                                  .first,
                              package: 'cosmos_epub',
                              fontSize: 15.sp,
                              fontWeight: (list[i].isSubChapters ?? false)
                                  ? FontWeight.w400
                                  : FontWeight.w600)),
                      10.verticalSpace,
                      Divider(height: 0, thickness: 1.h),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
