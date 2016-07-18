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

@class TTStyleContext;


// 这个类可以包含一个style链表。如果在TTView的链表节点中加入TTPartStyle类型的节点，相当于
// 在主链表的某个位置加入了一个新的子链表，而TTPartStyle可以根据名称来查询，这就让TTView的主链表
// 可以挂接任意多的子链表，并且可以根据名称取出使用。在Three20库中，TTPartStyle的唯一使用是在
// TTButton类中，目的是在TTView的draw函数绘制完style主链表的所有节点后，能够继续按照子链表中
// 的style绘制。具体的应用场景应该是TTButton是可以带图片的，而图片应该是覆盖在按钮之上，图片
// 不受按钮本身的颜色和风格影响，或者图片也有自己的风格。因此绘制图片的过程应该在绘制按钮之后开始，
// TTPartStyle可以放置图片的style，用做style主链表完成绘制后绘制，参见TTButton的drawRect函数。
// 从TTPartStyle的机制可以看出，TTPartStyle在链表中的位置是无关紧要的。
@interface TTPartStyle : TTStyle {
  NSString* _name;
  TTStyle*  _style;
}

@property (nonatomic, copy)   NSString* name;
@property (nonatomic, retain) TTStyle*  style;

+ (TTPartStyle*)styleWithName:(NSString*)name style:(TTStyle*)style next:(TTStyle*)next;

- (void)drawPart:(TTStyleContext*)context;

@end
