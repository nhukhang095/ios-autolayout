//
//  HScrollViewController.m
//  Layouts
//
//  Created by Joseph Nguyen on 5/9/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import "HScrollViewController.h"

@interface HScrollViewController (){
    NSMutableArray *infos;
}
@end

@implementation HScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self renderCustomerInHouse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)renderCustomerInHouse{
    
    int index = 0;
    for(int i = 0; i < 6; i++){
        CGFloat w = self.view.frame.size.width / 2 - 4;
        CGFloat h = self.svContainer.frame.size.height / 2 - 4;
        CGFloat x = (index / 2) * (self.view.frame.size.width / 2) + 2;
        CGFloat y = (index % 2) * (self.svContainer.frame.size.height / 2);
        
        UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 1, w - 4, 21)];
        [btn setTitle: [NSString stringWithFormat:@"Hello %d", i] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
        [btn setTitleColor:[CommonUtils colorFromHexCode:@"000000"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [btn setTag:index];
        [aview addSubview:btn];
        aview.layer.cornerRadius = 8;
        aview.backgroundColor = [CommonUtils colorFromHexCode:@"#ffffff"];
        [self.svContainer addSubview:aview];
        index++;
    }
    
    UIView *lLast = [self.svContainer.subviews lastObject];
    NSInteger wd = lLast.frame.origin.x;
    NSInteger ht = lLast.frame.size.width;
    
    float sizeOfContent = wd + ht;
    [self.svContainer setContentSize:CGSizeMake(sizeOfContent, self.svContainer.frame.size.height)];
}

@end
