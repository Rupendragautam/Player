![Player](https://github.com/piemonte/Player/raw/master/Player.gif)

## Player

`Player` is a simple iOS/tvOS video player library written in [Swift](https://developer.apple.com/swift/).

[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20tvOS-lightgrey.svg)](https://github.com/piemonte/Player) [![Swift Version](https://img.shields.io/badge/swift-5.0%2B-orange.svg)](https://developer.apple.com/swift) [![SPM Compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager) [![Pod Version](https://img.shields.io/cocoapods/v/Player.svg?style=flat)](http://cocoadocs.org/docsets/Player/) [![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/piemonte/Player/blob/master/LICENSE)

- Looking for an obj-c video player? Check out [PBJVideoPlayer (obj-c)](https://github.com/piemonte/PBJVideoPlayer).
- Looking for a Swift camera library? Check out [Next Level](https://github.com/NextLevel/NextLevel).

Need a different version of Swift?
* `5.0` - Target your Podfile to the latest release or master
* `4.2` - Target your Podfile to the `swift4.2` branch
* `4.0` - Target your Podfile to the `swift4.0` branch

### Features

- [x] plays local media or streams remote media over HTTP
- [x] customizable UI and user interaction
- [x] no size restrictions
- [x] orientation change support
- [x] simple API
- [x] video frame snapshot support

# Quick Start

`Player` is available for installation using Swift Package Manager, CocoaPods, or by manually copying the `Player.swift` file into your Xcode project.

## Swift Package Manager

Add Player to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/piemonte/Player.git", from: "0.15.0")
]
```

Or add it directly in Xcode via **File > Add Package Dependencies** and enter the repository URL.

## CocoaPods

```ruby
pod "Player", "~> 0.15.0"
```

## Manual Installation

Simply copy the `Player.swift` file from the `Sources` directory into your Xcode project.

## Usage

The sample project provides an example of how to integrate `Player`, otherwise you can follow these steps.

Allocate and add the `Player` controller to your view hierarchy.

``` Swift
 self.player = Player()
 self.player.playerDelegate = self
 self.player.playbackDelegate = self
 self.player.view.frame = self.view.bounds

 self.addChild(self.player)
 self.view.addSubview(self.player.view)
 self.player.didMove(toParent: self)
```

Provide the file path to the resource you would like to play locally or stream. Ensure you're including the file extension.

``` Swift
let videoUrl: URL = // file or http url
self.player.url = videoUrl
```

For HTTP streams with custom headers, use AVAsset:

``` Swift
let videoUrl: URL = // http url
let headers = ["Authorization": "Bearer token123"]
let asset = AVURLAsset(url: videoUrl, options: ["AVURLAssetHTTPHeaderFieldsKey": headers])
self.player.asset = asset
```

For iCloud Photos or PHAsset videos, use AVPlayerItem:

``` Swift
let playerItem: AVPlayerItem = // your player item
self.player.playerItem = playerItem
```

play/pause

``` Swift
 self.player.playFromBeginning()
```

Adjust the fill mode for the video, if needed.

``` Swift
 self.player.fillMode = .resizeAspectFit
```

Display video playback progress, if needed.

``` Swift
extension ViewController: PlayerPlaybackDelegate {

    public func playerPlaybackWillStartFromBeginning(_ player: Player) {
    }

    public func playerPlaybackDidEnd(_ player: Player) {
    }

    public func playerCurrentTimeDidChange(_ player: Player) {
        let fraction = Double(player.currentTime) / Double(player.maximumDuration)
        self._playbackViewController?.setProgress(progress: CGFloat(fraction), animated: true)
    }

    public func playerPlaybackWillLoop(_ player: Player) {
        self. _playbackViewController?.reset()
    }

}
```

## Documentation

You can find [the docs here](http://piemonte.github.io/Player/). Documentation is generated with [jazzy](https://github.com/realm/jazzy) and hosted on [GitHub-Pages](https://pages.github.com).

## Community

- Need help? Use [Stack Overflow](http://stackoverflow.com/questions/tagged/player-swift) with the tag 'player-swift'.
- Questions? Use [Stack Overflow](http://stackoverflow.com/questions/tagged/player-swift) with the tag 'player-swift'.
- Found a bug? Open an [issue](https://github.com/piemonte/player/issues).
- Feature idea? Open an [issue](https://github.com/piemonte/player/issues).
- Want to contribute? Submit a [pull request](https://github.com/piemonte/player/pulls).

## Resources

* [Swift Evolution](https://github.com/apple/swift-evolution)
* [AV Foundation Programming Guide](https://developer.apple.com/library/ios/documentation/AudioVideo/Conceptual/AVFoundationPG/Articles/00_Introduction.html)
* [Next Level](https://github.com/NextLevel/NextLevel/), rad media capture in Swift
* [PBJVision](https://github.com/piemonte/PBJVision), iOS camera engine, features touch-to-record video, slow motion video, and photo capture
* [PBJVideoPlayer](https://github.com/piemonte/PBJVideoPlayer), a simple iOS video player library, written in obj-c

## License

Player is available under the MIT license, see the [LICENSE](https://github.com/piemonte/player/blob/master/LICENSE) file for more information.
