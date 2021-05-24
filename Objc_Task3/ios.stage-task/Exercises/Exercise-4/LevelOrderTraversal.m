#import "LevelOrderTraversal.h"

int tmp;

@interface Node : NSObject
 
@property NSNumber *number;
@property Node *l_son;
@property Node *r_son;
 
- (Node *)initWithValue:(NSNumber *) value;
- (Node *)getTreeFromPreorder:(NSArray *) preorder;
- (NSMutableArray *) getLevelTrav;
 
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

- (NSMutableArray *)getLevelTrav {
    
    NSMutableArray *trav = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.number, nil], nil];
        
    if (self.l_son != nil) {
        NSArray *lSon = self.l_son.getLevelTrav;
        for (int i = 0; i < lSon.count; ++i) {
            if (i < trav.count - 1) {
                [trav[i + 1] addObjectsFromArray:lSon[i]];
            }
            else {
                [trav addObject: lSon[i]];
            }
        }
    }
    
    if (self.r_son != nil) {
        NSArray *rSon = self.r_son.getLevelTrav;
        for (int i = 0; i < rSon.count; ++i) {
            if (i < trav.count - 1) {
                [trav[i + 1] addObjectsFromArray:rSon[i]];
            }
            else {
                [trav addObject: rSon[i]];
            }
        }
    }
    
    
    return trav;
}
 
@end

int tmp = 0;

NSArray *LevelOrderTravForTree(NSArray *tree) {
    
    tmp = 0;
    Node *restoredTree = [[Node alloc] getTreeFromPreorder:tree];
    
    if (restoredTree) {
        return [restoredTree getLevelTrav];
    } else {
        return @[];
    }
}
