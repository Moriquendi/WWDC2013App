//
//  MSMenuViewController.m
//  WWDC2013App
//
//  Created by Michał Śmiałko on 28.04.2013.
//  Copyright (c) 2013 MS. All rights reserved.
//

#import "MSMenuViewController.h"
#import "MSMenuCollectionViewCell.h"
#import "MSProjectsViewController.h"
#import "MSWorkSchoolPageViewController.h"
#import <QuartzCore/QuartzCore.h>

NSString *const kMenuCellIdentifier = @"mci";

@interface MSMenuViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MSMenuViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Who am I?";

    self.view.backgroundColor = [UIColor clearColor];
//    self.view.backgroundColor = [UIColor colorWithWhite:64.f/255.f alpha:1.0];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MSMenuCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:kMenuCellIdentifier];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    // Clean up after disappearing animations
    for (UICollectionViewCell *cell in [self.collectionView visibleCells]) {
        [UIView animateWithDuration:0.3 animations:^{
            cell.alpha = 1.0;
            cell.transform = CGAffineTransformIdentity;
        }];
    }

    // Deselect selected cells
    for (NSIndexPath *selectedCellPath in [self.collectionView indexPathsForSelectedItems]) {
        [self.collectionView deselectItemAtIndexPath:selectedCellPath animated:YES];
    }
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MSMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMenuCellIdentifier forIndexPath:indexPath];
    
    cell.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    cell.layer.shadowRadius = 10.0;
    cell.layer.shadowOpacity = 1.0;
    cell.clipsToBounds = NO;
    
    NSArray *iconNames = @[@"iconProject", @"iconSchool", @"iconLearn", @"iconSchool"];
    NSArray *titles = @[@"Projects", @"Work & School", @"Learn & Teach", @""];
    NSArray *highlightedColors = @[[UIColor colorWithRed:214.f/255.f
                                                   green:205.f/255.f
                                                    blue:80.f/255.f
                                                   alpha:1.0],
                                   [UIColor colorWithRed:0./255.
                                                   green:161./255.
                                                    blue:154./255.
                                                   alpha:1.0],
                                   [UIColor colorWithRed:209.f/255.f
                                                   green:52.f/255.f
                                                    blue:73.f/255.f
                                                   alpha:1.0]];
    cell.highlightedColor = highlightedColors[indexPath.item];
    cell.title = titles[indexPath.item];
    cell.iconImage = [UIImage imageNamed:iconNames[indexPath.item]];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSTimeInterval delay = 0.0;
    for (UICollectionViewCell *cell in [collectionView visibleCells]) {
        if (![[collectionView indexPathForCell:cell] isEqual:indexPath]) {
            
            CGAffineTransform cellTransform = CGAffineTransformTranslate(cell.transform, 0, collectionView.frame.size.height*1.5);
            cellTransform = CGAffineTransformRotate(cellTransform, M_PI_4);
            [UIView animateWithDuration:0.5
                                  delay:delay
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 cell.alpha = 0.f;
                                 cell.transform = cellTransform;
                             }
                             completion:nil];
            
            delay += 0.15f;
        }
    }

    switch (indexPath.row) {
        case 0:
        case 2:
            [self performSelector:@selector(pushViewController:)
                       withObject:[[MSProjectsViewController alloc] init]
                       afterDelay:0.5];
            break;
        case 1:
            [self performSelector:@selector(pushViewController:)
                       withObject:[[MSWorkSchoolPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                                            navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                                          options:nil]
                       afterDelay:0.5];
            break;
        default:
            break;
    }
}

#pragma mark - MSMenuViewController

- (void)pushViewController:(UIViewController *)vc
{
    [self.navigationController pushViewController:vc animated:YES];
}
@end
