# TouchDraw

[![Join the chat at https://gitter.im/dehli/TouchDraw](https://badges.gitter.im/dehli/TouchDraw.svg)](https://gitter.im/dehli/TouchDraw?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

The `TouchDraw` module allows you to use the `TouchDrawView` class. This is a subclass of `UIView` which allows you to draw pictures with your finger.

## Installation

The easiest way to include `TouchDraw` is by using `CocoaPods` and adding the following to your `Podfile`.

```
use_frameworks!
pod 'TouchDraw', '~> 1.2'
```

If you're not using CocoaPods, you can add the `TouchDrawView.swift` file to your project.

## Usage

You can either programmatically add the `TouchDrawView` or add it using storyboards.

#### Storyboards

If using storyboards, you must add a `UIView` to your storyboard. Give it the `TouchDrawView` class, and `TouchDraw` module.

![Storyboard class](https://cloud.githubusercontent.com/assets/5856011/14061970/1da011c8-f365-11e5-8362-4bbe956b6152.png)

#### Code

If programmatically adding the view, you can use the `init(frame: CGRect)` method to create a new instance of `TouchDrawView`. You must make sure to write `import TouchDraw` at the top of the class.

#### Customizing

The first step when customizing the `TouchDrawView` is setting its `delegate`. The container must conform to `TouchDrawViewDelegate`, which has the following functions:

```
func undoEnabled() -> Void {
    // triggered when undo is enabled
    // (only if it was previously disabled)
}
```

```
func undoDisabled() -> Void {
    // triggered when undo is disabled
    // (only if it previously enabled)
}
```

```
func redoEnabled() -> Void {
    // triggered when redo is enabled
    // (only if it was previously disabled)
}
```

```
func redoDisabled() -> Void {
    // triggered when redo is disabled
    // (only if it previously enabled)
}
```

```
func clearEnabled() -> Void {
    // triggered when clear is enabled
    // (only if it was previously disabled)
}
```

```
func clearDisabled() -> Void {
    // triggered when clear is disabled
    // (only if it previously enabled)
}
```

The `TouchDrawView` exposes the following methods:

- `exportDrawing() -> UIImage`
- `clearDrawing()`
- `undo()`
- `redo()`
- `setColor(color: UIColor)`
- `setWidth(width: CGFloat)`

## Demo

If you'd like to see this library in action, you can download the entire repository and open [Demo/TouchDrawDemo.xcworkspace](Demo/TouchDrawDemo.xcworkspace).

[Demo/TouchDrawDemo/ViewController.swift](Demo/TouchDrawDemo/ViewController.swift) is where most of its functionality is demonstrated.

![Demo Screenshot](https://cloud.githubusercontent.com/assets/5856011/13918081/4b2fae7e-ef3b-11e5-96bd-978b62895aa7.png)

## Contributors

If you'd like to see additional functionality, feel free to open up a new issue or submit a pull request if you'd like to author it yourself.

## License

This package has the MIT license, which can be found here: [LICENSE](LICENSE).
