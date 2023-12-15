import 'package:app/models/cocktail_provider.dart';
import 'package:app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state_2 = ref.watch(getSelfMenuProvider);
    // state_2.when(data: (data) {print(data);}, error: (object,trace) {print("stack trace"); print(object);print(trace);}, loading: () {});
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/background.jpg')),
        ),
        child: Scaffold(backgroundColor: Colors.transparent, body: _Body()));
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "var foo = bar",
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
        ),
        Flexible(child: _MainContent())
      ],
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_Sidebar(), Flexible(child: _MenuList())],
    );
  }
}

class _MenuList extends StatelessWidget {
  const _MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 8,
        runSpacing: 8,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 150,
            height: 200,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 150,
            height: 200,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 150,
            height: 200,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 150,
            height: 200,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 150,
            height: 200,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 150,
            height: 200,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 150,
            height: 200,
          ),
        ],
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
      child: Column(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              "カクテル",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              "その他のドリンク",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              "その他",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          )
        ],
      ),
    );
  }
}

// class italy extends StatelessWidget {
//   const italy({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 200,
//       child: Row(
//         children: [
//           Flexible(
//             child: Container(
//               color: Colors.green,
//             ),
//           ),
//           Flexible(
//             child: Container(
//               color: Colors.white,
//             ),
//           ),
//           Flexible(child: Container(color: Colors.red))
//         ],
//       ),
//     );
//   }
// }

// class germany extends StatelessWidget {
//   const germany({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 180,
//       width: 300,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Flexible(
//             child: Container(
//               color: Colors.black,
//             ),
//           ),
//           Flexible(
//             child: Container(
//               color: Colors.red,
//             ),
//           ),
//           Flexible(
//             child: Container(
//               color: Colors.yellow,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class japan extends StatelessWidget {
//   const japan({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 200,
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               color: Colors.white,
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.red,
//               ),
//               width: 120,
//               height: 120,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
