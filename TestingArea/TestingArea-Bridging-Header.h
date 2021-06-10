#import <Foundation/Foundation.h>

@protocol PrintProtocolDelegate
- (void)processCompleted;
- (void)didCloseWithTrailingMetadata:(nullable NSDictionary *)trailingMetadata
                               error:(nullable NSError *)error;
@end
