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
#import "MSCocoaHeadsViewController.h"
#import "MSConferencesViewController.h"
#import "MSBaseViewController.h"
#import "MSAGHViewController.h"
#import "MSCocoaCampViewController.h"
#import <QuartzCore/QuartzCore.h>

NSString *const kMenuCellIdentifier = @"mci";

@interface MSMenuViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UIView *cloudView;
@property (nonatomic, strong) NSArray *textMessages;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (nonatomic, strong) NSTimer *messagesChangerTimer;
@end

@implementation MSMenuViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Who am I?";

    self.view.backgroundColor = [UIColor clearColor];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MSMenuCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:kMenuCellIdentifier];

    self.avatarImage.layer.cornerRadius = self.avatarImage.frame.size.width/2.f;
    self.avatarImage.clipsToBounds = YES;
    self.avatarImage.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.avatarImage.layer.borderWidth = 1.0;

    self.avatarImage.transform = CGAffineTransformScale(self.avatarImage.transform, 1/10, 1/10);
    self.cloudView.transform = CGAffineTransformScale(self.cloudView.transform, 1/10, 1/10);
    self.avatarImage.hidden = YES;
    
    self.textMessages = @[@"I'm 21 year old student...",
                          @"...and have spent 2 indescribable years learning iOS",
                          @"I'm studying Computer Science at AGH, Kraków.",
                          @"I love teaching others how to make iOS apps",
                          @"Hope to see you one day!",
                          @"PAUSE", // poison
                          @"Hey! Here's a short story of my life!"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    // Always show third item. Looks much nicer on small iPhone.
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:NO];
    
    if (self.avatarImage.hidden) {
        self.avatarImage.hidden = NO;
        [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.avatarImage.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.avatarImage.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.6 animations:^{
                    self.cloudView.transform = CGAffineTransformIdentity;
                }];
            }];
        }];
    }

    self.messagesChangerTimer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(changeMessage) userInfo:nil repeats:YES];
    
    // Clean up after disappearing animations
    for (UICollectionViewCell *cell in [self.collectionView visibleCells]) {
        [UIView animateWithDuration:0.45 animations:^{
            cell.alpha = 1.0;
            cell.transform = CGAffineTransformIdentity;
        }];
    }

    // Deselect selected cells
    for (NSIndexPath *selectedCellPath in [self.collectionView indexPathsForSelectedItems]) {
        [self.collectionView deselectItemAtIndexPath:selectedCellPath animated:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.messagesChangerTimer invalidate];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MSMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMenuCellIdentifier forIndexPath:indexPath];
    
    cell.layer.shadowColor = [[UIColor blackColor] CGColor];
    cell.layer.shadowRadius = 6.0;
    cell.layer.shadowOpacity = 0.6;
    cell.clipsToBounds = NO;
    
    NSArray *iconNames = @[@"iconProject", @"iconSchool", @"iconLearn"];
    NSArray *titles = @[@"Projects", @"Work & School", @"Learn & Teach"];
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
            [self performSelector:@selector(pushViewController:)
                       withObject:[[MSProjectsViewController alloc] init]
                       afterDelay:0.5];
            break;
        case 1: {
            NSArray *controllers = @[[[MSBaseViewController alloc] init],
                                     [[MSAGHViewController alloc] init]];
            MSWorkSchoolPageViewController *vc = [[MSWorkSchoolPageViewController alloc] initWithViewControllers:controllers];
            vc.title = @"Work & School";
            [self performSelector:@selector(pushViewController:)
                       withObject:vc
                       afterDelay:0.5];
        }
            break;
        case 2: {
            NSArray *controllers = @[[[MSCocoaHeadsViewController alloc] init],
                                     [[MSConferencesViewController alloc] init],
                                     [[MSCocoaCampViewController alloc] init]];
            MSWorkSchoolPageViewController *vc = [[MSWorkSchoolPageViewController alloc] initWithViewControllers:controllers];
            vc.title = @"Learn & Teach";
            [self performSelector:@selector(pushViewController:)
                       withObject:vc
                       afterDelay:0.5];
        }
            break;
        default:
            break;
    }
}

#pragma mark - MSMenuViewController

- (void)changeMessage
{
    static NSInteger currentMessageIndex = 0;
    
    if ([self.textMessages[currentMessageIndex] isEqualToString:@"PAUSE"]) {
        currentMessageIndex++;
        return;
    }
    [UIView animateWithDuration:0.4 animations:^{
        self.cloudView.transform = CGAffineTransformScale(self.cloudView.transform, 1/10, 1/10);
    } completion:^(BOOL finished) {
        self.messageLabel.text = self.textMessages[currentMessageIndex];
        currentMessageIndex++;
        if (currentMessageIndex == [self.textMessages count]) {
            currentMessageIndex = 0;
        }
        
        [UIView animateWithDuration:0.4 animations:^{
            self.cloudView.transform = CGAffineTransformIdentity;
        }];
    }];
}

- (void)pushViewController:(UIViewController *)vc
{
    [self.navigationController pushViewController:vc animated:YES];
}

@end
