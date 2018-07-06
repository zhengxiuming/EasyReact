/**
 * Beijing Sankuai Online Technology Co.,Ltd (Meituan)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

#import "ERTransform.h"
#import "ERNode+ProjectPrivate.h"

@interface ERTransform ()

@property (atomic, readwrite, unsafe_unretained, nullable) ERNode *from;
@property (atomic, readwrite, unsafe_unretained, nullable) ERNode *to;

@end

@implementation ERTransform

- (instancetype)init {
    if (self = [super init]) {
        _name = @"Link";
    }
    return self;
}

- (void)next:(nullable id)value from:(ERSenderList *)senderList  {
    [self.to next:value from:senderList];
}

- (void)linkNode:(nonnull ERNode *)fromNode to:(nonnull ERNode *)toNode {
    self.from = fromNode;
    self.to = toNode;
}

- (void)breakLinking { 
    self.from = nil;
    self.to = nil;
}

@end