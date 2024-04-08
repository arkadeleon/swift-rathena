//
//  Mode.m
//  rAthena
//
//  Created by Leon Li on 2024/4/8.
//

#import "Mode.h"
#include "config/renewal.hpp"

#ifdef RENEWAL
const Mode CurrentMode = ModeRenewal;
#else
const Mode CurrentMode = ModePrerenewal;
#endif
