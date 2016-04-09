//
//  ViewController.m
//  tomcatGame
//
//  Created by 陈一根陈一根 on 16/4/8.
//  Copyright © 2016年 陈一根. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tomImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchHeadOnClik:(UIButton *)sender {
    [self tomAnimateWith:@"knockout" imageCount:81];
}
- (IBAction)eatOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"eat" imageCount:40];
}

- (IBAction)stomachOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"stomach" imageCount:34];
}

- (IBAction)drinkOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"drink" imageCount:81];
}
- (IBAction)cymbalOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"cymbal" imageCount:13];

}

- (IBAction)fartOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"fart" imageCount:28];
}
- (IBAction)pieOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"pie" imageCount:24];
}
- (IBAction)scratchOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"scratch" imageCount:56];
}
- (IBAction)footRightOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"footRight" imageCount:30];
}

- (IBAction)footLeftOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"footLeft" imageCount:30];
}
- (IBAction)angryOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"angry" imageCount:26];
}


- (void)tomAnimateWith:(NSString *) fileName imageCount:(NSInteger)imageCount{
    
    //    0. 如果动画正在执行的话，就不会执行下面的代码
    if (self.tomImageView.isAnimating){
        return ;
    }
    //1.0首先 创建图片数组
    NSMutableArray * tomImages = [ NSMutableArray array];
    
    for (int i =0; i<imageCount; i++) {
        NSString * imageName = [NSString stringWithFormat:@"%@_%02d.jpg",fileName,i];
        //        创建图片的第一种方法（不用）会造成内存溢出
        //        UIImage *image = [UIImage imageNamed:imageName];
        
        //这种方式创建的图片 不会有内存溢出的问题
        NSString * path = [[NSBundle mainBundle]pathForResource:imageName ofType:nil];
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        [tomImages addObject:image];
    }
    
    //      2.  设置动画过程
    //      2.1 添加动画执行的图片数组
    [self.tomImageView setAnimationImages:tomImages];
    //      2.2 设置动画执行持续的时间
    [self.tomImageView setAnimationDuration:self.tomImageView.animationImages.count * 0.1];
    //    2.3 设置动画执行的次数
    [self.tomImageView setAnimationRepeatCount:1];
    //    2.4 设置动画开始执行
    [self.tomImageView startAnimating];
    //    3 在动画结束后清空数组
    [self performSelector:@selector(clearImages) withObject:nil afterDelay:self.tomImageView.animationDuration];
    
    //    3.1 在动画结束后清空数组的另外一种方法
    //    [self.tomImageView performSelector:@selector(setAnimationDuration:) withObject:nil afterDelay:self.tomImageView.animationDuration];
    
}
-(void) clearImages{
    
    self.tomImageView.animationImages = nil;
}


@end
