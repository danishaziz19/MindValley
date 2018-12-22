# Introduction

The purpose of the library is to abstract the downloading (images, pdf, zip, etc) and caching of remote resources (images, JSON, XML, etc)


## Installation

CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the Get Started section for more details.

```bash
platform :ios, '9.0'
pod 'MindV', :git => 'https://github.com/pakidanish/MindV.git', :branch => 'master', commit:'680536d'
```

## Usage

```python
import MindV


MindVL.shared().loadJsonAsData(from: url) { (response, error) in {

}

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
