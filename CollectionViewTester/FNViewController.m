//
//  FNViewController.m
//  CollectionViewTester
//
//  Created by John Fox on 5/2/14.
//

#import "FNViewController.h"

@interface FNViewController ()
{
    IBOutlet UIView *centerView;
    IBOutlet UICollectionView *collectionView;
}

@end

@implementation FNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // This nib file has a "live area" defined by an inner view. It's background is necessarily transparent
    UINib *myNib = [UINib nibWithNibName:@"FNDummyCollectionViewCell" bundle:nil];
    
    // All new cells will be created from this one
    [collectionView registerNib:myNib forCellWithReuseIdentifier:@"FNDummyCollectionViewCell"];
    
    // By turning off clipping, you'll see the prior and next items.
    collectionView.clipsToBounds = NO;

    UICollectionViewFlowLayout *myLayout = [[UICollectionViewFlowLayout alloc] init];
    
    CGFloat margin = ((self.view.frame.size.width - collectionView.frame.size.width) / 2);
    
    // This assumes that the the collectionView is centered withing its parent view.
    myLayout.itemSize = CGSizeMake(collectionView.frame.size.width + margin, collectionView.frame.size.height);

    // A negative margin will shift each item to the left. 
    myLayout.minimumLineSpacing = -margin;
    
    myLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    [collectionView setCollectionViewLayout:myLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSourceDelegate

- (NSInteger)collectionView:(UICollectionView *)aCollectionView
     numberOfItemsInSection:(NSInteger)aSection
{
    NSUInteger count = 20;
        
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)aCollectionView
                  cellForItemAtIndexPath:(NSIndexPath *)anIndexPath
{
    UICollectionViewCell *appropriateCell = [aCollectionView dequeueReusableCellWithReuseIdentifier:@"FNDummyCollectionViewCell"
                                                                                       forIndexPath:anIndexPath];
    
    return appropriateCell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)aCollectionView
                        layout:(UICollectionViewFlowLayout *)aCollectionViewLayout
        insetForSectionAtIndex:(NSInteger)aSection
{
    CGFloat margin = (aCollectionViewLayout.minimumLineSpacing / 2);
    
    // top, left, bottom, right
    UIEdgeInsets myInsets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return myInsets;
}

@end
