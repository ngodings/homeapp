import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/features/homepage/models/blog_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:homeapp/utils/string.dart';
import 'package:gap/gap.dart';

import '../models/candidate_model.dart';

class CandidateWidget extends StatelessWidget {
  const CandidateWidget({
    super.key,
    required this.big,
    required this.data,
  });
  final bool big;
  final CandidateModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: big ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 14.w),
        height: big ? 322.w : 275.w,
        width: big ? double.infinity : 255.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: const Color(0xFFFAFCFE),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1E000000),
              blurRadius: 10.w,
              spreadRadius: 0,
              offset: Offset(4.w, 4.w),
            )
          ],
        ),
        child: Column(
          children: [
            CachedNetworkImage(
                imageUrl: data.photo ?? imageHandler,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                      height: big ? 198.w : 150.w,
                      width: big ? double.infinity : 255.w,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12.w)),
                        color: const Color(0x998C8CA1),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                      ),
                    ),
                errorWidget: (context, url, error) => Container(
                      height: big ? 198.w : 150.w,
                      width: big ? double.infinity : 255.w,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12.w)),
                        color: const Color(0x998C8CA1),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                      ),
                    ),
                imageBuilder: (context, imgProvider) {
                  return Container(
                    height: big ? 198.w : 150.w,
                    width: big ? double.infinity : 255.w,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12.w)),
                      color: const Color(0x998C8CA1),
                      image: DecorationImage(
                          image: imgProvider, fit: BoxFit.cover),
                    ),
                  );
                }),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 16.w, horizontal: big ? 15.w : 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        data.name ?? '',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF008FD7)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(6.w),
                      Icon(
                        Icons.verified,
                        color: const Color(0xFF008FD7),
                        size: 14.w,
                      ),
                    ],
                  ),
                  Gap(16.w),
                  Row(
                    children: [
                      Text(
                        'Gender : ',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xFF8C8CA1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(8.w),
                      Text(
                        data.gender == 'm' ? 'Male' : 'Female' ?? '',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
