#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "TestModel.h"

@interface ViewModel : NSObject

@property TestModel *model;

- (RACSignal *)searchLineAPISignalForLine:(NSString *)searchLine;

- (NSInteger)numberOfItems;

@end
