//
//  ViewController.m
//  GTFOButton
//
//  Created by Jim Boulter on 11/7/15.
//  Copyright © 2015 JimBoulter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UITableView* tableView;

@end

@implementation ViewController
@synthesize tableView;

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.title = @"GTFO";
        
        tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        
        [self.view addSubview:tableView];
        
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = (int)indexPath.row;
    
    if(row == 0)
    {
        return [[GTFOPickerTableViewCell alloc] initWithMode:GTFOPickerModeFrom];
    }
    else if(row == 1)
    {
        return [[GTFOPickerTableViewCell alloc] initWithMode:GTFOPickerModeTo];
    }
    else if(row == 2 || row == 3)
    {
        return [[GTFONumberTableViewCell alloc] initWithMode:(row==2 ? GTFONumberModeNights : GTFONumberModePrice)];
    }
    else if(row == 4) return [[GTFOUberTableViewCell alloc] init];
    return [[GTFOButtonTableViewCell alloc] init];
}

@end
