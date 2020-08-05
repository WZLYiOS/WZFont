//
//  WZFont.h
//  WZFont
//
//  Created by xiaobin liu on 2019/6/24.
//  Copyright © 2019 xiaobin liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN


/**
 字体类型
 (注解: 一般一个字体绝对是一个文件,比如下面的DIN,DIN包含了粗体，DIN包含了中黑,这样子是分开两个文件,
 然后某中字体的如果是常规的话，名字就是这个字体的名字)
 - WZFontDINBold: DINBold
 - WZFontDINMedium: DINMedium
 - WZFontHelveticaLT: HelveticaLT
 - WZFontMittelschrift: Mittelschrift
 - WZFontSourceHanSerifCN: SourceHanSerifCN
 - WZFontTT0144M: FontTT0144M
 - WZFontwzlyhw: wzlyhw(UI胡伟:自制字体)
 */
typedef NS_ENUM(NSInteger, WZFontType) {
    WZFontDINBold = 0,
    WZFontDINMedium,
    WZFontHelveticaLT,
    WZFontMittelschrift,
    WZFontSourceHanSerifCN,
    WZFontTT0144M,
    WZFontwzlyhw
};


/**
 字体组件类
 */
@interface WZFont : NSObject


/**
 设置DINBold字体大小

 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setDINBoldForSize: (CGFloat)fontSize;



/**
 设置DINMedium字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setDINMediumForSize: (CGFloat)fontSize;


/**
 设置HelveticaLT字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setHelveticaLTForSize: (CGFloat)fontSize;


/**
 设置Mittelschrift字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setMittelschriftForSize: (CGFloat)fontSize;


/**
 设置SourceHanSerifCN字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setSourceHanSerifCNForSize: (CGFloat)fontSize;


/**
 设置WZFontTT0144M字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setTT0144MForSize: (CGFloat)fontSize;


/**
 设置Wzlyhw字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setWzlyhwForSize: (CGFloat)fontSize;


/**
 设置字体类型大小

 @param type 类型
 @param fontSize 字体大小
 @return 字体
 */
+(nullable UIFont*)setFontType: (WZFontType)type size:(CGFloat)fontSize;


/**
 自定义字体类型大小

 @param fontName 字体名称
 @param fontSize 字体大小
 @return 字体
 */
+ (nullable UIFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END
