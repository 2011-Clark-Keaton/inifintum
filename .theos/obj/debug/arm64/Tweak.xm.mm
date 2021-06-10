#line 1 "Tweak.xm"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBFolderController; @class SBFolder; @class SBFolderView; @class SBIconListPageControl; 
static NSInteger (*_logos_orig$_ungrouped$SBFolder$listCount)(_LOGOS_SELF_TYPE_NORMAL SBFolder* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$_ungrouped$SBFolder$listCount(_LOGOS_SELF_TYPE_NORMAL SBFolder* _LOGOS_SELF_CONST, SEL); static NSArray * (*_logos_orig$_ungrouped$SBFolder$lists)(_LOGOS_SELF_TYPE_NORMAL SBFolder* _LOGOS_SELF_CONST, SEL); static NSArray * _logos_method$_ungrouped$SBFolder$lists(_LOGOS_SELF_TYPE_NORMAL SBFolder* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBFolderView$_currentPageIndexDidChange)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBFolderView$_currentPageIndexDidChange(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static NSInteger (*_logos_orig$_ungrouped$SBFolderController$maximumPageIndex)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$_ungrouped$SBFolderController$maximumPageIndex(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static NSInteger (*_logos_orig$_ungrouped$SBFolderController$defaultPageIndex)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$_ungrouped$SBFolderController$defaultPageIndex(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); 

#line 15 "Tweak.xm"
















static NSInteger _logos_method$_ungrouped$SBFolder$listCount(_LOGOS_SELF_TYPE_NORMAL SBFolder* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){

  
  return _logos_orig$_ungrouped$SBFolder$listCount(self, _cmd);
}

static NSArray * _logos_method$_ungrouped$SBFolder$lists(_LOGOS_SELF_TYPE_NORMAL SBFolder* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){

  if ([_logos_orig$_ungrouped$SBFolder$lists(self, _cmd) count] > 0 && ![self isKindOfClass:NSClassFromString(@"SBRootFolderWithDock")]) {
    NSMutableArray *fixedViews = [[NSMutableArray alloc] initWithCapacity:([_logos_orig$_ungrouped$SBFolder$lists(self, _cmd) count] + 2)];
    int iterator = 0;
    for (int i = 0; i < ([_logos_orig$_ungrouped$SBFolder$lists(self, _cmd) count] + 2); i++){
      if (i == 0)
        [fixedViews insertObject:[_logos_orig$_ungrouped$SBFolder$lists(self, _cmd) objectAtIndex:([_logos_orig$_ungrouped$SBFolder$lists(self, _cmd) count] - 1)] atIndex:i];

      else if (i == ([_logos_orig$_ungrouped$SBFolder$lists(self, _cmd) count] + 1)) [fixedViews insertObject:[_logos_orig$_ungrouped$SBFolder$lists(self, _cmd) objectAtIndex:0] atIndex:i];
      else {
        [fixedViews insertObject:[_logos_orig$_ungrouped$SBFolder$lists(self, _cmd) objectAtIndex:iterator] atIndex:i];
        iterator++;
      }
    }
    return fixedViews;
  }
  return _logos_orig$_ungrouped$SBFolder$lists(self, _cmd);
}







static void _logos_method$_ungrouped$SBFolderView$_currentPageIndexDidChange(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  _logos_orig$_ungrouped$SBFolderView$_currentPageIndexDidChange(self, _cmd);
  if ([self currentPageIndex] == ([self maximumPageIndex]))
    [self setCurrentPageIndex:101 animated:NO];
  if ([self currentPageIndex] == ([self minimumPageIndex])){
    [self setCurrentPageIndex:([self maximumPageIndex] - 1) animated:NO];
    [self cleanUpAfterTransition];
  }
}







static NSInteger _logos_method$_ungrouped$SBFolderController$maximumPageIndex(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  return _logos_orig$_ungrouped$SBFolderController$maximumPageIndex(self, _cmd) + 2;
}


static NSInteger _logos_method$_ungrouped$SBFolderController$defaultPageIndex(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  return _logos_orig$_ungrouped$SBFolderController$defaultPageIndex(self, _cmd) + 1;
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBFolder = objc_getClass("SBFolder"); { MSHookMessageEx(_logos_class$_ungrouped$SBFolder, @selector(listCount), (IMP)&_logos_method$_ungrouped$SBFolder$listCount, (IMP*)&_logos_orig$_ungrouped$SBFolder$listCount);}{ MSHookMessageEx(_logos_class$_ungrouped$SBFolder, @selector(lists), (IMP)&_logos_method$_ungrouped$SBFolder$lists, (IMP*)&_logos_orig$_ungrouped$SBFolder$lists);}Class _logos_class$_ungrouped$SBFolderView = objc_getClass("SBFolderView"); { MSHookMessageEx(_logos_class$_ungrouped$SBFolderView, @selector(_currentPageIndexDidChange), (IMP)&_logos_method$_ungrouped$SBFolderView$_currentPageIndexDidChange, (IMP*)&_logos_orig$_ungrouped$SBFolderView$_currentPageIndexDidChange);}Class _logos_class$_ungrouped$SBFolderController = objc_getClass("SBFolderController"); { MSHookMessageEx(_logos_class$_ungrouped$SBFolderController, @selector(maximumPageIndex), (IMP)&_logos_method$_ungrouped$SBFolderController$maximumPageIndex, (IMP*)&_logos_orig$_ungrouped$SBFolderController$maximumPageIndex);}{ MSHookMessageEx(_logos_class$_ungrouped$SBFolderController, @selector(defaultPageIndex), (IMP)&_logos_method$_ungrouped$SBFolderController$defaultPageIndex, (IMP*)&_logos_orig$_ungrouped$SBFolderController$defaultPageIndex);}} }
#line 89 "Tweak.xm"
