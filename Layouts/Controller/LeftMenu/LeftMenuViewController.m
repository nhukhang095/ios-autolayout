//
//  LeftMenuViewController.m
//  Layouts
//
//  Created by Joseph Nguyen on 4/29/17.
//  Copyright © 2017 Joseph Nguyen. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "MenuHeaderTableViewCell.h"
#import "MenuHeaderItemTableViewCell.h"
#import "ImageViewController.h"
#import "AutoLayoutViewController.h"
#import "HScrollViewController.h"

@interface LeftMenuViewController (){
    NSMutableArray *groupTitles;
    NSMutableArray *groupIcons;
}

@end

@implementation LeftMenuViewController

-(void)backToProfile:(id)sender{
    [self.viewDeckController closeSide:YES];
}
-(void)setupNavigationBar{
    //create back bar button item
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"icon-back-white"] forState:UIControlStateNormal];
    [backButton sizeToFit];
    [backButton addTarget:self action:@selector(backToProfile:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* backButtonBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonBarItem;
    
    //new style
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[CommonUtils navigationBarBackGroundColor]];
    self.navigationController.navigationBar.topItem.title = NSLocalizedString(@"menu", nil);
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self initGroupTitle];
    self.tbvLeftMenu.delegate = self;
    self.tbvLeftMenu.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initGroupTitle{
    //init group title
    if (groupTitles==nil) {
        groupTitles = [NSMutableArray new];
        groupIcons = [NSMutableArray new];
    }else{
        [groupTitles removeAllObjects];
        [groupIcons removeAllObjects];
    }
    
    //Image View
    [groupTitles addObject:NSLocalizedString(@"image_view", nil)];
    [groupIcons addObject:@"menu_icon"];
    
    //Auto layout
    [groupTitles addObject:NSLocalizedString(@"auto_layout", nil)];
    [groupIcons addObject:@"menu_icon"];

    //Horizontal view
    [groupTitles addObject:NSLocalizedString(@"menu_h_scroll_view", nil)];
    [groupIcons addObject:@"menu_icon"];

}

-(void) sectionAction : (UIButton*)sender{
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }else{
        return [groupTitles count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 0){
        return 0;
    } else {
        return 30;
    }
}

/* have to implement delegate heightForHeaderInSection first */
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIButton* btnSection = [[UIButton alloc]init];
    [btnSection setTitleColor:[CommonUtils navigationBarBackGroundColor] forState:UIControlStateNormal];
    btnSection.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btnSection.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [btnSection setBackgroundColor:[UIColor whiteColor]];
    [btnSection setTag:section];
    
    [btnSection addTarget:self action:@selector(sectionAction:) forControlEvents:UIControlEventTouchUpInside];
    switch (section) {
        case 0:
            break;
        case 1:
            [btnSection setTitle:NSLocalizedString(@"menu_section_layout", nil) forState:UIControlStateNormal];
            break;
        case 2:
            [btnSection setTitle:NSLocalizedString(@"menu_section_program", nil) forState:UIControlStateNormal];
            break;
        case 3:
            [btnSection setTitle:NSLocalizedString(@"menu_h_scroll_view", nil) forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    
    
    return btnSection;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        //Menu Header
        MenuHeaderTableViewCell *cell = (MenuHeaderTableViewCell*)[self.tbvLeftMenu dequeueReusableCellWithIdentifier:@"menuHeaderCell" forIndexPath:indexPath];
        cell.lbHeader.text = NSLocalizedString(@"menu_header", nil);
        return cell;
    }else{
        //Menu Items
        MenuHeaderItemTableViewCell *cell = (MenuHeaderItemTableViewCell*)[self.tbvLeftMenu dequeueReusableCellWithIdentifier:@"menuItemCell" forIndexPath:indexPath];
        cell.menuItemImage.image = [UIImage imageNamed: groupIcons[indexPath.row]];
        cell.menuItemLabel.text = groupTitles[indexPath.row];
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSInteger cellIdx = indexPath.row;
    
    UIViewController *centerVC = nil;
    if(indexPath.section == 1){
        switch (cellIdx) {
                
            case 0: {
                if (![((UINavigationController*)self.viewDeckController.centerViewController).viewControllers[0] isKindOfClass:[ImageViewController class]]) {
                    
                    UIStoryboard *myhealth = [UIStoryboard storyboardWithName:@"ImageView" bundle:nil];
                    centerVC = [[UINavigationController alloc] initWithRootViewController:[myhealth instantiateViewControllerWithIdentifier:@"ImageViewController"]];
                }
                
                break;
            }
            case 1: {
                if (![((UINavigationController*)self.viewDeckController.centerViewController).viewControllers[0] isKindOfClass:[AutoLayoutViewController class]]) {
                    
                    UIStoryboard *myhealth = [UIStoryboard storyboardWithName:@"AutoLayout" bundle:nil];
                    centerVC = [[UINavigationController alloc] initWithRootViewController:[myhealth instantiateViewControllerWithIdentifier:@"AutoLayoutViewController"]];
                }
                
                break;
            }
            case 2: {
                if (![((UINavigationController*)self.viewDeckController.centerViewController).viewControllers[0] isKindOfClass:[HScrollViewController class]]) {
                    
                    UIStoryboard *hScrollView = [UIStoryboard storyboardWithName:@"HScrollView" bundle:nil];
                    centerVC = [[UINavigationController alloc] initWithRootViewController:[hScrollView instantiateViewControllerWithIdentifier:@"HScrollViewController"]];
                }
                
                break;
            }
            
        }
    }
    
    if (centerVC!=nil) {
        [self.viewDeckController closeSide:YES];
        [self.viewDeckController setCenterViewController:centerVC];
    } else {
        [self.viewDeckController closeSide:YES];
    }
}

@end
