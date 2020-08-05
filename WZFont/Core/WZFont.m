//
//  WZFont.m
//  WZFont
//
//  Created by xiaobin liu on 2019/6/24.
//  Copyright © 2019 xiaobin liu. All rights reserved.
//

#import "WZFont.h"
#import <CoreText/CTFontManager.h>

@implementation WZFont

/**
 运行时系统自动加载(目前先按照这种方式,这种会影响运行时的响应时长)
 */
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self dynamicallyLoadFont];
    });
}

/**
 设置DINBold字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setDINBoldForSize: (CGFloat)fontSize {
    return [WZFont setFontType: WZFontDINBold size:fontSize];
}

/**
 设置DINMedium字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(UIFont *)setDINMediumForSize:(CGFloat)fontSize {
    return [WZFont setFontType: WZFontDINMedium size:fontSize];
}


/**
 设置HelveticaLT字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setHelveticaLTForSize: (CGFloat)fontSize {
    return [WZFont setFontType: WZFontHelveticaLT size:fontSize];
}


/**
 设置Mittelschrift字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setMittelschriftForSize: (CGFloat)fontSize {
    return [WZFont setFontType: WZFontMittelschrift size:fontSize];
}

/**
 设置SourceHanSerifCN字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setSourceHanSerifCNForSize: (CGFloat)fontSize {
    return [WZFont setFontType: WZFontSourceHanSerifCN size:fontSize];
}


/**
 设置WZFontTT0144M字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setTT0144MForSize: (CGFloat)fontSize {
    return [WZFont setFontType: WZFontTT0144M size:fontSize];
}


/**
 设置Wzlyhw字体大小
 
 @param fontSize 字体大小
 @return UIFont
 */
+(nullable UIFont *)setWzlyhwForSize: (CGFloat)fontSize {
    return [WZFont setFontType: WZFontwzlyhw size:fontSize];
}


/**
 设置字体类型大小
 
 @param type 类型
 @param fontSize 字体大小
 @return 字体
 */
+(UIFont *)setFontType:(WZFontType)type size:(CGFloat)fontSize {
    
    NSString *fontName = @"";
    switch (type) {
        case WZFontDINBold:
            fontName = @"DIN-Bold";
            break;
        case WZFontDINMedium:
            fontName = @"DIN-Medium";
            break;
        case WZFontHelveticaLT:
            fontName = @"HelveticaNeue LT 107 XBlkCn";
            break;
        case WZFontMittelschrift:
            fontName = @"DINMittelschriftStd";
            break;
        case WZFontSourceHanSerifCN:
            fontName = @"SourceHanSerifCN-Bold";
            break;
        case WZFontTT0144M:
            fontName = @"Futura-Bold";
            break;
        case WZFontwzlyhw:
            fontName = @"Wzlyhw";
            break;
        default:
            break;
    }
    
    return  [UIFont fontWithName:fontName size: fontSize];
}


/**
 自定义字体类型大小
 
 @param fontName 字体名称
 @param fontSize 字体大小
 @return 字体
 */
+ (nullable UIFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    return  [UIFont fontWithName:fontName size: fontSize];
}

/**
 匹配字体类型资源路径
 
 @param type 字体类型
 */
+(NSString *)matchingBundlePathForFontType: (WZFontType)type {
    
    NSString *fontName = @"";
    switch (type) {
        case WZFontDINBold:
            fontName = @"DIN-Bold.otf";
            break;
        case WZFontDINMedium:
            fontName = @"DIN-Medium.otf";
            break;
        case WZFontHelveticaLT:
            fontName = @"HelveticaLT107ExtraBlackCondensed.ttf";
            break;
        case WZFontMittelschrift:
            fontName = @"Mittelschrift.ttf";
            break;
        case WZFontSourceHanSerifCN:
            fontName = @"SourceHanSerifCN-Bold-wzlyapp.ttf";
            break;
        case WZFontTT0144M:
            fontName = @"TT0144M.TTF";
            break;
        case WZFontwzlyhw:
            fontName = @"wzlyhw-SVG.otf";
            break;
        default:
            break;
    }
    return fontName;
}

/**
 动态加载字体
 */
+(void)dynamicallyLoadFont {
    
    NSArray <NSNumber *> * array = @[@(WZFontDINBold),
                                     @(WZFontDINMedium),
                                     @(WZFontHelveticaLT),
                                     @(WZFontMittelschrift),
                                     @(WZFontSourceHanSerifCN),
                                     @(WZFontTT0144M),
                                     @(WZFontwzlyhw)];
    for (NSNumber* type in array) {
        NSString *name = [self matchingBundlePathForFontType: type.integerValue];
        NSString *bundlePath = [[NSBundle bundleForClass:[WZFont class]] pathForAuxiliaryExecutable:name];
        [self loadFontForPath: bundlePath];
    }
}


/**
 加载字体数据
 参考: https://marco.org/2012/12/21/ios-dynamic-font-loading
 @param bundlePath 路径
 */
+(void)loadFontForPath:(NSString *)bundlePath {
    
    NSURL *url = [NSURL fileURLWithPath:bundlePath];
    NSData *fontData = [NSData dataWithContentsOfURL:url];
    CFErrorRef error;
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)fontData);
    CGFontRef font = CGFontCreateWithDataProvider(provider);
    if (!CTFontManagerRegisterGraphicsFont(font, &error)) {
        CFStringRef errorDescription = CFErrorCopyDescription(error);
#if DEBUG
        NSLog(@"Failed to load font: %@", errorDescription);
#endif
        CFRelease(errorDescription);
    }
    CFRelease(font);
    CFRelease(provider);
}

@end
