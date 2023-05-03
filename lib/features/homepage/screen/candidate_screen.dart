import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_cubit.dart';
import '../widgets/candidate_widget.dart';
import '../widgets/loading_widget.dart';

class CandidateScreen extends StatelessWidget {
  const CandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: const _CandidateScreen(),
    );
  }
}

class _CandidateScreen extends HookWidget {
  const _CandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeC = context.read<HomeCubit>();
    useEffect(() {
      homeC.getCandidatesC();
      return;
    }, []);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoading) {
          return const CustomLoadingWidget();
        }
        if (state is GetCandidateSuccess) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 14.w),
            shrinkWrap: true,
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 36.w),
                child: GestureDetector(
                  onPanUpdate: (details) {},
                  child: CandidateWidget(
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
