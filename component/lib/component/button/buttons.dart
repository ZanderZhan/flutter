import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Demo'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('TextButton: ', style: Theme.of(context).textTheme.titleMedium),
          const TextButtons(),
          Text('OutlinedButton: ',
              style: Theme.of(context).textTheme.titleMedium),
          const OutlinedButtons(),
          Text('ElevatedButton: ',
              style: Theme.of(context).textTheme.titleMedium),
          const ElevatedButtons(),
          const SizedBox(
            height: 30,
          ),
          const Text('1. 怎么支持缩放的点击态\n'
              '2. 怎么支持透明度改变的点击态\n'
              '3. 怎么方便的处理 enabled 和 disabled 的状态\n'
              '4. 怎么方便的处理 icon text\n'
              '5. 怎么支持渐变背景'),
        ]),
      ),
    );
  }
}

class TextButtons extends StatelessWidget {
  const TextButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('button'),
        ),
        const TextButton(onPressed: null, child: Text('disabled')),
        TextButton(
          onPressed: () {},
          child: const Text('取消默认大小'),
          style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size.zero)),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('点击态背景色'),
          style: ButtonStyle(
              // 用 foregroundColor 来定义字体颜色（不是 textStyle）。
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return null;
              }),
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.deepOrange)),
        ),
      ],
    );
  }
}

class OutlinedButtons extends StatelessWidget {
  const OutlinedButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: [
        OutlinedButton(onPressed: () {}, child: const Text('button')),
        OutlinedButton(
          onPressed: () {},
          child: const Text('边框状态'),
          style: ButtonStyle(
              side: MaterialStateProperty.all(const BorderSide(
                  color: Colors.red, width: 2, style: BorderStyle.solid))),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('圆角大小'),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))))),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('圆角'),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const CircleBorder())),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('半圆角，取最短边'),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const StadiumBorder())),
        ),
      ],
    );
  }
}

class ElevatedButtons extends StatelessWidget {
  const ElevatedButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('button'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('阴影颜色'),
          style:
              ButtonStyle(shadowColor: MaterialStateProperty.all(Colors.red)),
        ),
        ElevatedButton(
            onPressed: () {},
            child: const Text('阴影大小'),
            style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.red),
                elevation: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return 10;
                  }
                  return 6;
                })))
      ],
    );
  }
}
