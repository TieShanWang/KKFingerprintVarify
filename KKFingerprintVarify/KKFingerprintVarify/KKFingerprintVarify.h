//
//  KKFingerprintVarify.h
//  tmp
//
//  Created by MR.KING on 16/7/13.
//  Copyright © 2016年 KING. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <LocalAuthentication/LAError.h>

/*
typedef enum : NSUInteger {
    KKFingerprintVarifyStateSuccess,// 成功
    KKFingerprintVarifyStateFail,
    KKFingerprintVarifyStateLock,// 锁定
    KKFingerprintVarifyStateUserCancel,// cancel by user
    KKFingerprintVarifyStateFallBack, // 用户点击非取消的按钮
    KKFingerprintVarifyStateCancel,
    KKFingerprintVarifyStateUNKnow // 位置错误
} KKFingerprintVarifyState;
*/
@interface KKFingerprintVarify : NSObject

+(void)canEvalue:(void(^)(BOOL suc,NSError * error))result;

+(void)varifyWithReason:(NSString*)reasonTitle
                 result:(void(^)(BOOL suc ,LAError error))result;

+(void)varifyWithFallBackTitle:(NSString*)fallBackTitle
                        reason:(NSString*)reasonTitle
                   maxDuration:(NSNumber*)seconds
                   cancelTitle:(NSString*)cancelTitle
                        result:(void(^)(BOOL suc ,LAError error))result;

@end
