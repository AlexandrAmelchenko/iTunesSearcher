#import "ViewModel.h"
#import "API.h"

@implementation ViewModel

- (RACSignal *)searchLineAPISignalForLine:(NSString *)searchLine {
    return [RACSignal createSignal:^RACDisposable *(id subscriber) {
        [[API sharedInstance] getSearchResultsByLine:searchLine
                                             success:^(TestModel *model) {
                                                 self.model = model;
                                                 [subscriber sendNext:model];
                                                 [subscriber sendCompleted];
                                             }                                    failure:^(NSError *errorMessage) {
                                                 [subscriber sendError:nil];
                                             }];
        return nil;
    }
            ];
}

- (NSInteger)numberOfItems {
    if (self.model == nil || self.model.results == nil) {
        return 0;
    }
    return self.model.results.count;
}

@end
