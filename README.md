# Three20Style
一个基于Quartz 2D绘图API的类框架，是Facebook Three20项目的一部分。
### 介绍
Three20是Facebook的一个开源框架，由于过于庞大和复杂已不再维护。但其中某些部分相对独立并且侵入性也比较小，适合做成库。Three20Style就是其中一部分。
### 设计目标
Quartz 2D提供的API基本上都是纯C形式的，没有面向对象的封装，使用起来比较繁琐。如果想使用UI类来绘制路径，貌似只有UIBezierPath可用。但想实现更复杂一些的功能，例如渐变、阴影等，仍然需要C方式的API。Three20Style在一定程度上解决了这个问题，它用面向对象的形式封装了各种常用的形状（路径）、渐变和阴影，并通过一种很便捷的方式将他们组合起来，从而简化了2D绘图操作。
### 设计思想
1 将各种Quartz 2D效果（路径、渐变、阴影等）抽象为TTStyle类的子类。
```objective-c
@class TTStyleContext;

@interface TTStyle : NSObject {
  TTStyle* _next;
}

@property (nonatomic, retain) TTStyle* next;

- (id)initWithNext:(TTStyle*)next;

- (TTStyle*)next:(TTStyle*)next;

- (void)draw:(TTStyleContext*)context;

- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size;
- (CGSize)addToSize:(CGSize)size context:(TTStyleContext*)context;

- (void)addStyle:(TTStyle*)style;

- (id)firstStyleOfClass:(Class)cls;
- (id)styleForPart:(NSString*)name;

- (void)logContextFrame:(NSString *)className rect:(CGRect)rect;
@end
```
2 TTStyle类被实现为一个链表，这样就可以构造一个style链表，因为一个复杂效果经常是由一组简单效果叠加而成的。这非常类似于Photoshop的图层概念，一个复杂的图片是由好多图层叠加而成。例如下面的代码实现一个有两个圆角的矩形：
```objective-c
// Partially rounded rectangle
[TTShapeStyle styleWithShape:
 [TTRoundedRectangleShape shapeWithTopLeft:0 topRight:0 bottomRight:10 bottomLeft:10] next:
  [TTSolidFillStyle styleWithColor:[UIColor whiteColor] next:
   [TTSolidBorderStyle styleWithColor:black width:1 next:nil]]],
```
