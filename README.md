# Introduction

IOS DEVELOPER CHALLENGE

Evaluation Criteria for this Assignment

1. Readability

Class and method names should clearly show their intent and responsibility.
2. Maintainability

“SOLID” Principles and design pattern.
MVC model
3. Scalability

Your software should easily accommodate possible future requirement changes
4. Testability

Please accompany your code with test classes. √
The app should be able to run on any device running iOS 10 and above. Please make sure the app can be compiled directly from XCode 10.
Your task

Imagine you are on the Pinterest iOS team and you are working with some colleagues on the pinboard (the scrolling wall of images), you split up the tasks among each other and your task is to create an image loading library that will be used to asynchronously download the images for the pins on the pinboard when they are needed.

The library will also be useful for all other parts of the app where asynchronous remote image loading is required. The images are available on a publicly accessible URL (like a CDN). The library should be general purpose and not assume anything about the use case, the pinboard is an example but other parts of the app that show images will also use it (e.g. a user's profile pic on the profile screen).

One of your colleagues will also want to use the library for loading JSON documents, and you just know that your boss and colleagues will love your library so much that they will ask you to support other data types in the future as well, so your design should not limit support to a particular data type.

The purpose of the library is to abstract the downloading (images, pdf, zip, etc) and caching of remote resources (images, JSON, XML, etc) so that client code can easily "swap" a URL for any kind of files ( JSON, XML, etc) without worrying about any of the details. Resources which are reused often should not be continually re-downloaded and should be cached, but the library cannot use infinite memory.

Requirements

Use the following url for loading data: http://pastebin.com/raw/wgkJgazE 

Images and JSON should be cached efficiently (in-memory only, no need for caching to disk); 

The cache should have a configurable max capacity and should evict images not recently used; 

An image load may be cancelled; 

The same image may be requested by multiple sources simultaneously (even before it has loaded), and if one of the sources cancels the load, it should not affect the remaining requests; 

Multiple distinct resources may be requested in parallel; 

You can work under the assumption that the same URL will always return the same resource; 

The library should be easy to integrate into new iOS project / apps; 

You are supposed to build a solid structure and use the needed programming design patterns; 

Think that the list of item returned by the API can reach 100 items or even more. At a time, you should only load 10 items, and load more from the API when the user reach the end of the list; 

Usage of size classes is an advantage; 

Usage of cool animations and transitions is an advantage;

Adding "pull to refresh" is an advantage. 

Last considerations

Please understand that this test becomes the showcase of your skills, so don't skip on professional programming standards. 

## Solution

I created a framework Library name as [MindV](https://github.com/pakidanish/MindV) as we have to use same function for different projects as well. So we can pod MindV Library into any project.

How to Pod MindV Library:
 

```bash
platform :ios, '9.0'
pod 'MindV', :git => 'https://github.com/pakidanish/MindV.git', :tag => '1.0.9'    
```

How to use MindV Library:


```python
import MindV

MindVL.shared().loadJsonAsData(from: url) { (response, error) in {

}

MindVL.shared().loadImage(from: url, imageView: self, placeHolder: "placeHolder_image")

```
Third Party Library for Json Parsing
* [Freddy](https://github.com/bignerdranch/Freddy)

## Features

* Pull to refresh
* Cacha Library [MindV](https://github.com/pakidanish/MindV) for Json and Image Cacha
* Json Parsing [Freddy](https://github.com/bignerdranch/Freddy)
* Size classes and Constraints
* Image downloading cancel Function using [MindV](https://github.com/pakidanish/MindV) 
* Cache configurable
* Extension for Date - Reference : [Date+timeAgo](https://gist.github.com/merlos/4a116900771180066cc1461b9edae86d)
* Extension for UIImageView
 

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)