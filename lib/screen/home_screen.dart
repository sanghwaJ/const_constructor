import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const => 불변 값, 빌드 타임 시점에 값을 알고 있어야 함
            // widget에 const를 선언하면, App이 실행되는 동안 딱 한 번만 빌드가 실행되며, 그 후엔 해당 widget을 그대로 사용함
            // 따라서, const를 붙여주어야 더 효율적으로 렌더링 할 수 있음
            const TestWidget(label: 'test1'),
            const TestWidget(label: 'test2'),
            // ElevatedButton onPressed 함수에서 어떤 일이 일어날지 알 수 없기 때문에 const를 지정할 수 없음
            ElevatedButton(
              onPressed: () {
                // setState => 빌드 재실행
                setState(() {

                });
              },
              child: const Text('빌드'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  final String label;

  const TestWidget({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$label 빌드 실행');
    return Container(
      child: Text(
        label,
      ),
    );
  }
}
