//
//  Delegate.h
//  Lesson29
//
//  Created by OUT-Shneyderman-MY on 6/7/21.
//

#import <Foundation/Foundation.h>
#import "DelegateProtocol.h"

@interface MassivDelegate : NSObject


@property (nonatomic, weak) id<DelegateProtocol> current;


- (void)create;

@end
