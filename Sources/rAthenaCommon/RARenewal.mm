//
//  RARenewal.m
//  rAthena
//
//  Created by Leon Li on 2024/1/4.
//

#import "RARenewal.h"
#include "config/renewal.hpp"

#ifdef RENEWAL
const BOOL RA_RENEWAL = YES;
#else
const BOOL RA_RENEWAL = NO;
#endif
