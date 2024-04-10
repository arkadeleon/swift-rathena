//
//  Mode.m
//  rAthena
//
//  Created by Leon Li on 2024/4/8.
//

#import "ServerMode.h"
#include "config/renewal.hpp"

#ifdef RENEWAL
const ServerMode CurrentServerMode = ServerModeRenewal;
#else
const ServerMode CurrentServerMode = ServerModePrerenewal;
#endif
