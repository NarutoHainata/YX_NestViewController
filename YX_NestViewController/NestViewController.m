//
//  NestViewController.m
//  YX_NestViewController
//
//  Created by yang on 16/8/1.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "NestViewController.h"
#import "TestViewController.h"
#import "MissViewController.h"
@interface NestViewController ()
@property(nonatomic, strong) TestViewController *tvc;
@property(nonatomic, strong) MissViewController *mvc;
@end

@implementation NestViewController

-(TestViewController*)tvc{
    if (_tvc == nil) {
        _tvc = [[TestViewController alloc]init];
    }
    return _tvc;
}
-(MissViewController*)mvc{
    if (_mvc == nil) {
        _mvc = [[MissViewController alloc]init];
    }
    return _mvc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc]initWithItems:nil];
    //    segmentControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [segmentControl insertSegmentWithTitle:@"test" atIndex:0 animated:YES];
    [segmentControl insertSegmentWithTitle:@"miss" atIndex:1 animated:YES];
    self.navigationItem.titleView = segmentControl;
    segmentControl.selectedSegmentIndex = 0;
    [segmentControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.tvc.view];
    
    
    
    
}
-(void)change:(UISegmentedControl *)sender{

    if ([sender selectedSegmentIndex] == 1) {
        [self.view addSubview:self.mvc.view];
        [self.tvc.view removeFromSuperview];
    }
    else if ([sender selectedSegmentIndex] == 0){
        [self.view addSubview:self.tvc.view];
        [self.mvc.view removeFromSuperview];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
