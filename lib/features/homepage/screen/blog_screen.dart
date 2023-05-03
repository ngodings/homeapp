import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/features/homepage/widgets/blog_widget.dart';

import '../cubit/home_cubit.dart';
import '../widgets/loading_widget.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: const _BlogScreen(),
    );
  }
}

class _BlogScreen extends HookWidget {
  const _BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeC = context.read<HomeCubit>();
    useEffect(() {
      homeC.getBlogsC();
      return;
    }, []);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoading) {
          return const CustomLoadingWidget();
        }
        if (state is GetBlogSuccess) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 14.w),
            shrinkWrap: true,
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 36.w),
                child: GestureDetector(
                  onPanUpdate: (details) {},
                  child: BlogWidget(
                    data: state.data[index],
                    big: true,
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
