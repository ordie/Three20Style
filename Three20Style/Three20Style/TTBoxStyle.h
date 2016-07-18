//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

// Style
#import "TTStyle.h"
#import "TTPosition.h"

// 这个Style本意应该是实现一个全功能的类似CSS中Box的类，这个类按照padding指定的值
// 改变context.contentFrame的大小
@interface TTBoxStyle : TTStyle {
  UIEdgeInsets  _margin;
  UIEdgeInsets  _padding;
  CGSize        _minSize;
  TTPosition    _position;
}

@property (nonatomic) UIEdgeInsets  margin;
@property (nonatomic) UIEdgeInsets  padding;
@property (nonatomic) CGSize        minSize;
@property (nonatomic) TTPosition    position;

+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin next:(TTStyle*)next;
+ (TTBoxStyle*)styleWithPadding:(UIEdgeInsets)padding next:(TTStyle*)next;
+ (TTBoxStyle*)styleWithFloats:(TTPosition)position next:(TTStyle*)next;
+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                          next:(TTStyle*)next;
+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                       minSize:(CGSize)minSize position:(TTPosition)position next:(TTStyle*)next;

@end