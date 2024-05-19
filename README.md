<p align="center">
  <a href="https://github.com/manaspratap/reveal_on_pull/stargazers">
    <img alt="Stargazers" src="https://img.shields.io/github/stars/manaspratap/reveal_on_pull.svg?style=for-the-badge"/>
  </a>
  <a href="https://github.com/manaspratap/reveal_on_pull/network/members">
    <img alt="Forks" src="https://img.shields.io/github/forks/manaspratap/reveal_on_pull.svg?style=for-the-badge"/>
  </a>
  <a href="https://github.com/manaspratap/reveal_on_pull/graphs/contributors">
    <img alt="Contributors" src="https://img.shields.io/github/contributors/manaspratap/reveal_on_pull.svg?style=for-the-badge"/>
  </a>
  <a href="https://github.com/manaspratap/reveal_on_pull/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/manaspratap/reveal_on_pull.svg?style=for-the-badge"/>
  </a>
  <a href="https://github.com/manaspratap/reveal_on_pull/blob/master/LICENSE.txt">
    <img alt="MIT License" src="https://img.shields.io/github/license/manaspratap/reveal_on_pull.svg?style=for-the-badge"/>
  </a>
  <br />
   <a href="https://www.buymeacoffee.com/manaspratap">
    <img alt="Buy Me A Coffee" src="https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black"/>
  </a>
   <a href="https://www.linkedin.com/in/manaspratapthakur">
    <img alt="LinkedIn" src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/>
  </a>
   <a href="https://manaspratap.com">
    <img alt="My Website" src="https://img.shields.io/badge/My%20Website-4285F4?style=for-the-badge&logo=google-chrome&logoColor=white"/>
  </a>
</p>

<br />
<p align="center">
  <h1 align="center">RevealOnPull</h1>
</p>

📖 Table of Contents

- Features
- Installation
- Usage
- Example
- Contributing
- License

✨ Features

Easily reveal a hidden widget on pull down.
Customizable reveal behavior and animations.
Smooth and responsive user experience.
Compatible with both iOS and Android.

📦 Installation

Add the following to your pubspec.yaml file:

yaml
Copy code
dependencies:
reveal_on_pull: ^1.0.0
Then, run flutter pub get to install the package.

🚀 Usage

To use this package, wrap your widget tree with RevealOnPull and specify the widget to be revealed.

```dart
RevealOnPull(
  scrollController: scrollController,
  animationDuration: const Duration(milliseconds: 500),
  widgetToRevealHeight: widgetToRevealHeight,
  widgetToReveal: Container(
    height: widgetToRevealHeight,
    width: MediaQuery.of(context).size.width,
    color: Colors.red,
  ),
  scrollableChild: CustomScrollView(
    controller: scrollController,
    physics: const ClampingScrollPhysics(),
    slivers: [
      SliverList(
        delegate: SliverChildListDelegate(
          [
            for (var index = 0; index < 100; index++)
              Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                ),
                alignment: Alignment.center,
                child: Text('$index'),
              ),
          ],
        ),
      ),
    ],
  ),
)
```

🧪 Example

Check out the example directory for a complete sample app using RevealOnPull.

## 📺 Demo Video

![reveal_on_pull Demo](assets/screen_recording.gif)

🤝 Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request on GitHub.

Steps to Contribute
Fork the repository.
Create a new branch: git checkout -b my-feature-branch.
Make your changes and commit: git commit -m 'Add some feature'.
Push to the branch: git push origin my-feature-branch.
Open a pull request.

📄 License

This project is licensed under the BSD 3-Clause License. See the LICENSE file for more details.
