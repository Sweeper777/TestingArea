#import <Foundation/Foundation.h>
#import "TestingArea-Swift.h"

@interface SampleClass:NSObject
/* method declaration */
- (void)max:(ABCAnimal)num1 andNum2:(ABCAnimal)num2;
@end

@implementation SampleClass

- (void) max:(ABCAnimal) num1 andNum2:(ABCAnimal) num2 {
    BOOL a = ABCAnimalCat == num1;
}

@end
