//
//  RFMarkdownTextView.m
//  RFMarkdownTextViewDemo
//
//  Created by Rex Finn on 12/1/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "RFMarkdownTextView.h"

@interface RFMarkdownTextView ()

@property (strong,nonatomic) RFMarkdownSyntaxStorage *syntaxStorage;

@end

@implementation RFMarkdownTextView

- (id)initWithFrame:(CGRect)frame {
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]}];
    
    _syntaxStorage = [RFMarkdownSyntaxStorage new];
    [_syntaxStorage appendAttributedString:attrString];
    
    CGRect newTextViewRect = frame;
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    CGSize containerSize = CGSizeMake(newTextViewRect.size.width,  CGFLOAT_MAX);
    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:containerSize];
    container.widthTracksTextView = YES;
    
    [layoutManager addTextContainer:container];
    [_syntaxStorage addLayoutManager:layoutManager];
    
    self = [super initWithFrame:frame textContainer:container];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)textViewDidChange:(UITextView *)textView {
    [_syntaxStorage update];
}

@end