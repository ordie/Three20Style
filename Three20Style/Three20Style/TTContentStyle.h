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

// TTContentStyle提供一个机会，在TTView按照链表顺序绘制各个style的过程中，可以在TTContentStyle
// 节点处回调本控件的drawLayer方法，在drawLayer方法中，控件可以根据当前context中的属性做各种处理，
// 例如TTImageView可以在drawLayer中，根据当前context中的frame大小绘制图片，而不是控件的bounds。
@interface TTContentStyle : TTStyle

+ (TTContentStyle*)styleWithNext:(TTStyle*)next;

@end
