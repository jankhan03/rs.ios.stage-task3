#import "LevelOrderTraversal.h"

@interface Node : NSObject
 
@property NSNumber *number;
@property Node *l_son;
@property Node *r_son;
 
- (Node *)initWithValue:(NSNumber *)value;
- (Node *)getTreeFromPreorder:(NSArray *) preorder;
- (NSMutableArray *)getLevelTraversal;
 
@end

@implementation Node
 
- (Node *)initWithValue:(NSNumber *)value {
 
    self = [super init];
    if (self != nil) {
        self.number = value;
        self.l_son = NULL;
        self.r_son = NULL;
    }
    return self;
}

- (Node *)getTreeFromPreorder:(NSArray *)preorder {
    if ([preorder count] <= tmp || preorder[tmp] == [NSNull null]) {
        return nil;
    }
    
    Node *root = [[Node alloc] initWithValue: preorder[tmp]];
    
    if (([preorder count] - 1) == tmp) {
        return root;
    }
    
    tmp++;
    root.l_son = [[Node alloc] getTreeFromPreorder: preorder];
    
    tmp++;
    root.r_son = [[Node alloc] getTreeFromPreorder: preorder];
    
    return root;
}

- (NSMutableArray *)getLevelTraversal {
    
    NSMutableArray *traversal = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.number, nil], nil];
        
    if (self.l_son != nil) {
        NSArray *left = self.l_son.getLevelTraversal;
        for (int i = 0; i < left.count; ++i) {
            if (i < traversal.count - 1) {
                [traversal[i + 1] addObjectsFromArray:left[i]];
            } else {
                [traversal addObject: left[i]];
            }
        }
    }
    
    if (self.r_son != nil) {
        NSArray *right = self.r_son.getLevelTraversal;
        for (int i = 0; i < right.count; ++i) {
            if (i < traversal.count - 1) {
                [traversal[i + 1] addObjectsFromArray:right[i]];
            } else {
                [traversal addObject: right[i]];
            }
        }
    }
    
    return traversal;
}
 
@end

int tmp = 0;

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    tmp = 0;
    Node *restoredTree = [[Node alloc] getTreeFromPreorder:tree];
    
    if (restoredTree) {
        return [restoredTree getLevelTraversal];
    } else {
        return @[];
    }
}
