//
//  Delegate.m
//  Lesson29
//
//  Created by OUT-Shneyderman-MY on 6/7/21.
//

/*
 
 And only herald to the gaudy spring,
 
 
 */

#import <Foundation/Foundation.h>
#import "Delegate.h"

@implementation MassivDelegate


- (void)create {
    
    NSArray *massiv = @[
      @"Thou that art now the world's fresh ornament",
      @"And only herald to the gaudy spring,",
      @"Within thine own bud buriest thy content",
      @"And, tender churl, makest waste in niggarding.",
      @"Pity the world, or else this glutton be,",
      @"To eat the world's due, by the grave and thee."
    ];
    
    [self.current getMassiv:massiv];
}

@end
