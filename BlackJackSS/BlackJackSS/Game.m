//
//  Game.m
//  First
//
//  Created by Sergey Vandanov on 15.10.2019.
//  Copyright © 2019 Sergey Vandanov. All rights reserved.
//

#import "NSArray+Card.h"
#import "Game.h"
#import "Card.h"

@interface Game ()
    -(NSString *) _getCardNames:(NSArray *) cards;
    -(NSInteger) _calcScoreFor:(NSArray*) cards;

@end
@implementation Game
-(instancetype)init
{
    self = [super init];
    if(self) {
        _myCards = [[NSMutableArray alloc]init];
        _dealerCards = [[NSMutableArray alloc]init];
        _busyCards = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void) startGame {
    NSMutableArray * allCards = [[NSMutableArray alloc] init];
    [allCards addObject: @"Two - Clubs"];
    [allCards addObject: @"Two - Diamonds"];
    [allCards addObject: @"Two - Hearts"];
    [allCards addObject: @"Two - Spades"];
    [allCards addObject: @"Three - Clubs"];
    [allCards addObject: @"Three - Diamonds"];
    [allCards addObject: @"Three - Spades"];
    [allCards addObject: @"Three - Hearts"];
    [allCards addObject: @"Four - Clubs"];
    [allCards addObject: @"Four - Diamonds"];
    [allCards addObject: @"Four - Hearts"];
    [allCards addObject: @"Four - Spades"];
    [allCards addObject: @"Five - Clubs"];
    [allCards addObject: @"Five - Diamonds"];
    [allCards addObject: @"Five - Hearts"];
    [allCards addObject: @"Five - Spades"];
    [allCards addObject: @"Six - Clubs"];
    [allCards addObject: @"Six - Diamonds"];
    [allCards addObject: @"Six - Hearts"];
    [allCards addObject: @"Six - Spades"];
    [allCards addObject: @"Seven - Clubs"];
    [allCards addObject: @"Seven - Diamonds"];
    [allCards addObject: @"Seven - Hearts"];
    [allCards addObject: @"Seven - Spades"];
    [allCards addObject: @"Eight - Clubs"];
    [allCards addObject: @"Eight - Diamonds"];
    [allCards addObject: @"Eight - Hearts"];
    [allCards addObject: @"Eight - Spades"];
    [allCards addObject: @"Nine - Clubs"];
    [allCards addObject: @"Nine - Diamonds"];
    [allCards addObject: @"Nine - Hearts"];
    [allCards addObject: @"Nine - Spades"];
    [allCards addObject: @"Ten - Clubs"];
    [allCards addObject: @"Ten - Diamonds"];
    [allCards addObject: @"Ten - Hearts"];
    [allCards addObject: @"Ten - Spades"];
    [allCards addObject: @"Jack - Clubs"];
    [allCards addObject: @"Jack - Diamonds"];
    [allCards addObject: @"Jack - Hearts"];
    [allCards addObject: @"Jack - Spades"];
    [allCards addObject: @"Queen - Clubs"];
    [allCards addObject: @"Queen - Diamonds"];
    [allCards addObject: @"Queen - Hearts"];
    [allCards addObject: @"Queen - Spades"];
    [allCards addObject: @"King - Clubs"];
    [allCards addObject: @"King - Diamonds"];
    [allCards addObject: @"King - Hearts"];
    [allCards addObject: @"King - Spades"];
    [allCards addObject: @"Ace - Clubs"];
    [allCards addObject: @"Ace - Diamonds"];
    [allCards addObject: @"Ace - Hearts"];
    [allCards addObject: @"Ace - Spades"];
    
    unsigned long count = [allCards count];
    unsigned int index = arc4random_uniform(count);
    
    NSString * card1 = [allCards objectAtIndex:(index)];
    [allCards removeObjectAtIndex: index];

    count = [allCards count];
    index = arc4random_uniform(count);
    NSString * card2 = [allCards objectAtIndex:(index)];
    [allCards removeObjectAtIndex: index];
    
    count = [allCards count];
    index = arc4random_uniform(count);
    NSString * card3 = [allCards objectAtIndex:(index)];
    [allCards removeObjectAtIndex: index];
  
   
    [_myCards addObject: card1];    // creare array with elem card1,card2
    [_myCards addObject: card2];
    [_dealerCards addObject: card3];
    [self printMy];
    [self printDealer];
}
-(void) hitMe {
    Card * cardx = [Card new];
    [self.myCards addObject: cardx];

}
- (BOOL)hitDealer {
    NSInteger dealerScore = [self _calcScoreFor:self.dealerCards];
    if(dealerScore>17) {
        return NO;
    }
    Card * cardx = [Card new];
    [self.dealerCards addObject:cardx];
    return YES;
}
-(BOOL) iHaveBlackJack {
    NSInteger myScore = [self _calcScoreFor:self.myCards];
       if(myScore==21) {
           return YES;
       }
;
       return NO;
}

-(BOOL) delaerHasBlackJack {
    NSInteger dealerScore = [self _calcScoreFor:self.dealerCards];
       if(dealerScore==21) {
           return YES;
       }
       return NO;
}

-(BOOL) iHaveMore {
    NSInteger myScore = [self _calcScoreFor:self.myCards];
       if(myScore>21) {
           return YES;
       }
       return NO;
}


-(BOOL) dealerHasMore {
    NSInteger dealerScore = [self _calcScoreFor:self.dealerCards];
       if(dealerScore>21) {
           return YES;
       }
       return NO;
}

-(BOOL) scoreEqual {
    NSInteger dealerScore = [self _calcScoreFor:self.dealerCards];
    NSInteger myScore = [self _calcScoreFor:self.myCards];
       if(dealerScore==myScore ) {
           return YES;
       }
       return NO;
}

-(BOOL) iHaveHigherScore {
    NSInteger dealerScore =[self.dealerCards _calcScore];
    NSInteger myScore = [self _calcScoreFor:self.myCards];
    if(dealerScore<myScore) {
        return YES;
    }
    return NO;
}
-(void) printMy {
    NSLog(@"You have: %@",[self _getCardNames:self.myCards]);
}
-(void) printDealer {
    NSLog(@"Dealer has: %@",[self _getCardNames:self.dealerCards]);
}

-(NSString *) _getCardNames:(NSArray *) cards{
    return [cards _getCardNames];
}
-(NSInteger) _calcScoreFor:(NSArray*) cards {
    return [cards _calcScore];
}

@end
