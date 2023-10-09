import 'package:flutter/material.dart';
import 'package:setup_structure/res/app_context_extension.dart';


class CommonStatus extends StatelessWidget {
  final String title;
  const CommonStatus({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(title == 'OPERATING') {
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.statePurple,
        ),
        child: Text('進行中', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    else if(title == 'BEFORE'){
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.stateBlue,
        ),
        child: Text('予定', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    else if(title == 'STOPING'){
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.stateRed,
        ),
        child: Text('停車', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    else if(title == 'HEADING'){
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.statePurple,
        ),
        child: Text('進行中', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    else if(title == 'PASSED'){
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.stateGreen,
        ),
        child: Text('終了', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    else if(title == 'RESERVED'){
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.stateDeepBlue,
        ),
        child: Text('予約済', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    else if(title == 'BOADDING'){
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.stateBlue,
        ),
        child: Text('搭乗', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    else if(title == 'FINISHED'){
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.stateGreen,
        ),
        child: Text('終了', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    else if(title == 'CANCELED'){
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.stateRed,
        ),
        child: Text('取消', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    else if(title == 'NOSHOW'){
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
          color: context.resources.color.stateRed,
        ),
        child: Text('ノーショー', style: context.resources.style.w400s12(context.resources.color.white)),
      );
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
        color: context.resources.color.stateGreen,
      ),
      child: Text('終了', style: context.resources.style.w400s12(context.resources.color.white)),
    );
  }
}
