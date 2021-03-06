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

#import "TTBoxStyle.h"

// Style
#import "TTStyleContext.h"

// Core
#import "TTGlobalCoreRects.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTBoxStyle

@synthesize margin    = _margin;
@synthesize padding   = _padding;
@synthesize minSize   = _minSize;
@synthesize position  = _position;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(TTStyle*)next {
	self = [super initWithNext:next];
  if (self) {
    _margin = UIEdgeInsetsZero;
    _padding = UIEdgeInsetsZero;
    _minSize = CGSizeZero;
    _position = TTPositionStatic;
  }

  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin next:(TTStyle*)next {
  TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
  style.margin = margin;
  return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (TTBoxStyle*)styleWithPadding:(UIEdgeInsets)padding next:(TTStyle*)next {
  TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
  style.padding = padding;
  return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (TTBoxStyle*)styleWithFloats:(TTPosition)position next:(TTStyle*)next {
  TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
  style.position = position;
  return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                          next:(TTStyle*)next {
  TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
  style.margin = margin;
  style.padding = padding;
  return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (TTBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                       minSize:(CGSize)minSize position:(TTPosition)position next:(TTStyle*)next {
  TTBoxStyle* style = [[[self alloc] initWithNext:next] autorelease];
  style.margin = margin;
  style.padding = padding;
  style.minSize = minSize;
  style.position = position;
  return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(TTStyleContext*)context {
  context.contentFrame = TTRectInset(context.contentFrame, _padding);
    [self logContextFrame:@"TTBoxStyle" rect:context.frame];
  [self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context {
  size.width += _padding.left + _padding.right;
  size.height += _padding.top + _padding.bottom;

  if (_next) {
    return [self.next addToSize:size context:context];

  } else {
    return size;
  }
}


@end
