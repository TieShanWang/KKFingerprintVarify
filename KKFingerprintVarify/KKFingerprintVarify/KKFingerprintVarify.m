//
//  KKFingerprintVarify.m
//  tmp
//
//  Created by MR.KING on 16/7/13.
//  Copyright © 2016年 KING. All rights reserved.
//

#import "KKFingerprintVarify.h"

#import <LocalAuthentication/LocalAuthentication.h>

#if (__IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_10_0)
#error finger print only can be used before 8.0
#endif

@implementation KKFingerprintVarify



+(void)canEvalue:(void (^)(BOOL, NSError *))result{
    LAContext * context = [[LAContext alloc]init];
    NSError * error ;
    BOOL can = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    if (can) {
        result(YES,nil);
    }else{
        result(NO,error);
    }
}

+(void)varifyWithReason:(NSString*)reasonTitle
                 result:(void(^)(BOOL suc ,LAError error))result{
    [self varifyWithFallBackTitle:nil reason:reasonTitle maxDuration:nil cancelTitle:nil result:result];
}


+(void)varifyWithFallBackTitle:(NSString*)fallBackTitle
                                reason:(NSString*)reasonTitle
                           maxDuration:(NSNumber*)seconds
                           cancelTitle:(NSString*)cancelTitle
                        result:(void(^)(BOOL suc ,LAError error))result{
    
    LAContext * context = [[LAContext alloc]init];
#ifdef __IPHONE_10_0
    if (cancelTitle) {
        context.localizedCancelTitle = cancelTitle;
    }
#endif
    if (fallBackTitle) {
        context.localizedFallbackTitle = fallBackTitle;
    }
#ifdef __IPHONE_10_0
    if (seconds) {
         context.touchIDAuthenticationAllowableReuseDuration = [seconds integerValue];
    }
#endif
    
    NSString * reason = (reasonTitle)?:@"";
    
    BOOL can =[context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil];
    
    if (can) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:reason reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@"解锁成功");
                result(YES,0);
            }else{
                NSLog(@"失败:%@",error);
                result(NO,error.code);
            }
        }];
    }
}
/*
static NSString * const KKErrorAuthenticationFailed = @"授权失败";

static NSString * const KKErrorUserCancel = @"授权失败";

static NSString * const KKErrorUserFallback = @"授权失败";

static NSString * const KKErrorSystemCancel = @"授权失败";

static NSString * const KKErrorPasscodeNotSet = @"授权失败";

static NSString * const KKErrorTouchIDNotAvaiKKble = @"授权失败";

static NSString * const KKErrorTouchIDNotEnrolled = @"授权失败";

static NSString * const KKErrorTouchIDLockout = @"授权失败";

static NSString * const KKErrorAppCancel = @"授权失败";

static NSString * const KKErrorAuthenticationFailed = @"授权失败";

*/




@end
