//
//  ViewController.m
//  Lesson29
//
//  Created by OUT-Shneyderman-MY on 6/7/21.
//

#import "ViewController.h"
#import "Delegate.h"

@interface ViewController () <DelegateProtocol>

@property (strong,nonatomic) MassivDelegate* delegate;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.delegate = [MassivDelegate new];
  self.delegate.current = self;
  [self.delegate create];
}


- (void)getMassiv:(NSArray *)massiv {
  NSArray *sortedArray = [massiv sortedArrayUsingComparator: ^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
    
    NSUInteger *firstObjc = [[obj1 componentsSeparatedByString:@"i"] count];
    //то же самое в другом
    NSUInteger *secondObjc = [[obj2 componentsSeparatedByString:@"i"] count];
    
    if (firstObjc > secondObjc ) {
      return NSOrderedAscending;
    } else if (firstObjc < secondObjc) {
      return  NSOrderedDescending;
    } else {
      return NSOrderedSame;
    }
  }];
  
  NSLog(@"%@", sortedArray);
}

@end
