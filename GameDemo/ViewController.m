//
//  ViewController.m
//  GameDemo
//
//  Created by qiager on 16/1/21.
//  Copyright © 2016年 qiager. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *maskImage;
@property (nonatomic, strong) UIImageView *bonusImage;
@property (nonatomic, strong) UILabel *priceLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _maskImage = [self createBonusImage];
    _maskImage.center = self.view.center;
    [self.view addSubview:_maskImage];
    
    _maskImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _maskImage.center = self.view.center;
    _maskImage.image = [UIImage imageNamed:@"mask_img"];
    [self.view addSubview:_maskImage];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height-60, self.view.frame.size.width-40, 40)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"再来一次" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}


- (void)reset{
    _maskImage.image = [UIImage imageNamed:@"mask_img"];
    _priceLabel.text = [self createRandomBonus];
}

- (UIImageView *)createBonusImage{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    imageView.image = [UIImage imageNamed:@"back_img"];

    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    _priceLabel.font = [UIFont boldSystemFontOfSize:18];
    _priceLabel.text = [self createRandomBonus];
    _priceLabel.numberOfLines = 0;
    [imageView addSubview:_priceLabel];
    
    return imageView;
}

- (NSString*)createRandomBonus{
    
    NSUInteger index = arc4random()%100;
    NSInteger price = index;
    
    if (price<10) {
        return @"奖个5块";
    }
    
    if (price<20) {
        return @"奖个20块";
    }
    if (price<30) {
        return @"奖个100大洋";
    }
    if (price<40) {
        return @"奖个毛线";
    }
    if (price<50) {
        return @"奖个啥";
    }
    if (price<60) {
        return @"奖个媳妇";
    }
    if (price<70) {
        return @"奖个车";
    }
    
    return  [NSString stringWithFormat:@"%ld 大洋", (long)price];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    
    CGPoint point = [[touches anyObject] locationInView:_maskImage];
    
    if ([_maskImage.layer containsPoint:point]) {
      
        CGRect clearRect = CGRectMake(point.x-5, point.y-5, 10, 10);
        
        CGSize size = _maskImage.frame.size;
        
        UIGraphicsBeginImageContext(size);
        
        [_maskImage.image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        
        CGContextClearRect(UIGraphicsGetCurrentContext(), clearRect);
        
        _maskImage.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
    }
    
}

@end
