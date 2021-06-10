#import <UIKit/UIKit.h>

@interface SBFolderView : UIView
- (NSInteger)defaultPageIndex;
- (NSInteger)maximumPageIndex;
- (NSInteger)currentPageIndex;
- (NSInteger)minimumPageIndex;
- (BOOL)setCurrentPageIndex:(long long)arg1 animated:(BOOL)arg2;
- (BOOL)setCurrentPageIndex:(long long)arg1 animated:(BOOL)arg2 completion:(id)arg3;
- (unsigned long long)pageCount;
- (void)cancelScrolling;
- (void)cleanUpAfterTransition;
@end

%hook SBIconListPageControl

/*
- (void)setNumberOfPages:(NSInteger)arg1{
  return %orig(arg1 - 2);
}

- (void)setCurrentPage:(NSInteger)arg1{
  return %orig(arg1 - 1);
}
*/
%end


%hook SBFolder

- (NSInteger)listCount{
//  if ([self isKindOfClass:NSClassFromString(@"SBRootFolderWithDock")])
  //  return %orig() + 1;
  return %orig();
}

- (NSArray *)lists{

  if ([%orig() count] > 0 && ![self isKindOfClass:NSClassFromString(@"SBRootFolderWithDock")]) {
    NSMutableArray *fixedViews = [[NSMutableArray alloc] initWithCapacity:([%orig() count] + 2)];
    int iterator = 0;
    for (int i = 0; i < ([%orig count] + 2); i++){
      if (i == 0)
        [fixedViews insertObject:[%orig() objectAtIndex:([%orig count] - 1)] atIndex:i];
      else if (i == ([%orig count] + 1))
        [fixedViews insertObject:[%orig() objectAtIndex:0] atIndex:i];
      else {
        [fixedViews insertObject:[%orig() objectAtIndex:iterator] atIndex:i];
        iterator++;
      }
    }
    return fixedViews;
  }
  return %orig();
}


%end


%hook SBFolderView

-(void)_currentPageIndexDidChange{
  %orig();
  if ([self currentPageIndex] == ([self maximumPageIndex]))
    [self setCurrentPageIndex:101 animated:NO];
  if ([self currentPageIndex] == ([self minimumPageIndex])){
    [self setCurrentPageIndex:([self maximumPageIndex] - 1) animated:NO];
    [self cleanUpAfterTransition];
  }
}

%end



%hook SBFolderController

- (NSInteger)maximumPageIndex{
  return %orig() + 2;
}


- (NSInteger)defaultPageIndex{
  return %orig() + 1;
}

%end
