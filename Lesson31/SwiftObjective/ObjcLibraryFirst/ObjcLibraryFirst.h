//
//  ObjcLibraryFirst.h
//  ObjcLibraryFirst
//
//  Created by Марк Шнейдерман on 11.07.2021.
//

#import <Foundation/Foundation.h>
#import "ObjcLibrarySecond.h"

@interface ObjcLibraryFirst : NSObject

@property (strong, nonatomic, readonly) NSString *string;
@property (strong, nonatomic, readonly) ObjcLibrarySecond *nextLib;

@end


