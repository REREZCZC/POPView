#import "UIColor+REColors.h"


@implementation UIColor (REColors)

+ (UIColor *)dark {
    return [UIColor colorWithHexStrings:@"#00545b"];
}

+ (UIColor *)darkGray {
    return [UIColor colorWithHexStrings:@"#CC333333"];
}


+ (UIColor *)TutorialPopupBackground {
    return [UIColor colorWithHexStrings:@"#cccdcd"];
}


+ (UIColor *)darkTeal {
    return [UIColor colorWithHexStrings:@"#008996"];
}


//hex strings
+ (UIColor *)colorWithHexStrings:(NSString * )hexString {
    //convert Objc NSString to C strin
    const char *cString = [hexString cStringUsingEncoding: NSASCIIStringEncoding];
    
    //Strip optional #
    if (cString[0] == '#') cString++;
    //Validate is hex string
    for (const char *charPtr = cString; *charPtr != 0; charPtr++) {
        char ch = *charPtr;
        BOOL isHexDigit = (ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'F');
        if (!isHexDigit) return  nil;
        if (charPtr - cString > 8) return nil;
    }
    
    //make canonical hex string
    char canonicalARGB[8 + 1];
    canonicalARGB[8] = 0;
    switch (strlen(cString)) {
        case 3:
            canonicalARGB[0] = canonicalARGB[1] = 'F'; //ALPHA
            for (int i = 0; i < 6; i++) {
                canonicalARGB[i + 2] = cString[i / 2];
            }
            break;
        case 4:
            for (int i = 0; i < 8; i++) {
                canonicalARGB[i] = cString[i / 2];
            }
            break;
        case 6:
            canonicalARGB[0] = canonicalARGB[1] = 'F'; //ALPHA
            strcpy(canonicalARGB + 2, cString);
            break;
        case 8:
            strcpy(canonicalARGB, cString);
            break;
            
        default:
            return nil;
    }
    
    long long int hex = strtoll(canonicalARGB, NULL, 16);
    
    CGFloat alpha = (CGFloat)((hex & 0xFF000000) >> 24) / 255.f;
    CGFloat red   = (CGFloat)((hex & 0x00FF0000) >> 16) / 255.f;
    CGFloat green = (CGFloat)((hex & 0x0000FF00) >> 8)  / 255.f;
    CGFloat blue  = (CGFloat)((hex & 0x000000FF) >> 0)  / 255.f;
    
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return color;
}


@end
