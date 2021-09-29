<a href="https://www.simform.com/"><img src="https://github.com/SimformSolutionsPvtLtd/SSToastMessage/blob/master/simformBanner.png"></a>

SSMediaLibrary
=============
[![CocoaPods Version](https://img.shields.io/cocoapods/v/SSMediaLibrary.svg)](http://cocoadocs.org/docsets/SSMediaLibrary)
[![Platform](https://img.shields.io/cocoapods/p/SSMediaLibrary.svg?style=flat)](http://cocoapods.org/pods/SSMediaLibrary)
[![License](https://img.shields.io/cocoapods/l/SSMediaLibrary.svg?style=flat)](https://cocoapods.org/pods/SSMediaLibrary)
[![Swift Version][swift-image]][swift-url]
[![PRs Welcome][PR-image]][PR-url]
[![Twitter](https://img.shields.io/badge/Twitter-@simform-blue.svg?style=flat)](https://twitter.com/simform)

SSMediaLibrary is written in Swift with the use of Combine framework. It will download and open up following files:
* iWork documents
* Microsoft Office documents (Office ‘97 and newer)
* Rich Text Format (RTF) documents
* PDF files
* Images
* Text files whose uniform type identifier (UTI) conforms to the public.text type
* Comma-separated value (csv) files
* Video
* Any URL

Setup Instructions
------------------
[CocoaPods](http://cocoapods.org)
------------------
To integrate SSMediaLibrary into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
pod 'SSMediaLibrary', '~> 0.1.5'
```
and in your code add `import SSMediaLibrary`.

[Swift Package Manager](https://swift.org/package-manager/)
------------------
When using Xcode 11 or later, you can install `SSMediaLibrary` by going to your Project settings > `Swift Packages` and add the repository by providing the GitHub URL. Alternatively, you can go to `File` > `Swift Packages` > `Add Package Dependencies...`

## Manually

1. Add `MediaManager.swift`, `NetworkManager.swift` and `UTI.swift` to your project.
2. Grab yourself a cold 🍺.

## Requirements
* iOS 13+
* Xcode 11+

# Usage
1. Just provide URL to the MediaManager
2. Call the show function of MediaManager

Basic Examples
---------
```swift
guard let url = URL(string: "http://www.africau.edu/images/default/sample.pdf") else { return }
let manager = MediaManager(url: url)
manager.show()
```

<h3><a href="https://github.com/SimformSolutionsPvtLtd"><u>🗂 Check out our other libraries→</u></a></h3>


## MIT License

Copyright (c) 2020 Simform Solutions

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[PR-image]:https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat
[PR-url]:http://makeapullrequest.com
[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
