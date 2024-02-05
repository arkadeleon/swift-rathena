//
//  Item+DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaDatabase

extension Item: DatabaseRecord {
    var recordID: Int {
        id
    }

    var recordTitle: String {
        name
    }

    func recordFields(with database: Database) async throws -> DatabaseRecordFields {
        var fields = DatabaseRecordFields()

        fields.append("ID", value: "#\(id)")
        fields.append("Aegis Name", value: aegisName)
        fields.append("Name", value: name)

        fields.append("Type", value: type.description)

        switch subType {
        case .none:
            break
        case .weapon(let weaponType):
            fields.append("Weapon Type", value: weaponType.description)
        case .ammo(let ammoType):
            fields.append("Ammo Type", value: ammoType.description)
        case .card(let cardType):
            fields.append("Card Type", value: cardType.description)
        }

        fields.append("Buy", value: "\(buy)z")
        fields.append("Sell", value: "\(sell)z")
        fields.append("Gender", value: gender.description)

        switch type {
        case .weapon:
            fields.append("Attack", value: attack)
            fields.append("Magic Attack", value: magicAttack)
            fields.append("Attack Range", value: range)
            fields.append("Weapon Level", value: weaponLevel)
        case .armor:
            fields.append("Defense", value: defense)
            fields.append("Armor Level", value: armorLevel)
        default:
            break
        }

        switch type {
        case .weapon, .armor:
            fields.append("Slots", value: slots)
            fields.append("Minimum Level", value: equipLevelMin)
            fields.append("Maximum Level", value: equipLevelMax)
            fields.append("Refinable", value: refineable ? "Yes" : "No")
            fields.append("Gradable", value: gradable ? "Yes" : "No")
        default:
            break;
        }

//        NSArray<RAJob *> *jobs = [[RAJobDatabase sharedDatabase] allRecords];
//        NSMutableArray<RADatabaseRecordField *> *jobFields = [NSMutableArray arrayWithCapacity:jobs.count];
//        for (RAJob *job in jobs) {
//            if ([self canBeEquippedByJob:job.jobID]) {
//                [jobFields ra_addFieldWithName:job.jobName referenceValue:job];
//            }
//        }
//        [fields ra_addFieldWithName:@"Jobs" arrayValue:jobFields];

        // TODO: Locations

        // TODO: View

        // TODO: Alias Name

        return fields
    }

    /// @discussion See function @c pc_job_can_use_item in pc.cpp
    /// @discussion See function @c pc_isItemClass in pc.cpp
//    - (BOOL)canBeEquippedByJob:(NSInteger)jobID {
//        uint64 clazz = pc_jobid2mapid(jobID);
//
//        // Calculate the required bit to check
//        uint64 job = 1ULL << ( clazz & MAPID_BASEMASK );
//
//        size_t index;
//
//        // 2-1
//        if( ( clazz & JOBL_2_1 ) != 0 ){
//            index = 1;
//        // 2-2
//        }else if( ( clazz & JOBL_2_2 ) != 0 ){
//            index = 2;
//        // Basejob
//        }else{
//            index = 0;
//        }
//
//        if (( self.jobs[index].unsignedIntegerValue & job ) == 0) {
//            return NO;
//        }
//
//        if (self.classes&ITEMJ_NORMAL && !(clazz&(JOBL_UPPER|JOBL_BABY|JOBL_THIRD|JOBL_FOURTH)))    //normal classes (no upper, no baby, no third, no fourth)
//            return YES;
//    #ifndef RENEWAL
//        //allow third classes to use trans. class items
//        if (self.classes&ITEMJ_UPPER && clazz&(JOBL_UPPER|JOBL_THIRD))    //trans. classes
//            return YES;
//        //third-baby classes can use same item too
//        if (self.classes&ITEMJ_BABY && clazz&JOBL_BABY)    //baby classes
//            return YES;
//        //don't need to decide specific rules for third-classes?
//        //items for third classes can be used for all third classes
//        if (self.classes&(ITEMJ_THIRD|ITEMJ_THIRD_UPPER|ITEMJ_THIRD_BABY) && clazz&JOBL_THIRD)
//            return YES;
//    #else
//        //trans. classes (exl. third-trans.)
//        if (self.classes&ITEMJ_UPPER && clazz&JOBL_UPPER && !(clazz&JOBL_THIRD))
//            return YES;
//        //baby classes (exl. third-baby)
//        if (self.classes&ITEMJ_BABY && clazz&JOBL_BABY && !(clazz&JOBL_THIRD))
//            return YES;
//        //third classes (exl. third-trans. and baby-third and fourth)
//        if (self.classes&ITEMJ_THIRD && clazz&JOBL_THIRD && !(clazz&(JOBL_UPPER|JOBL_BABY)) && !(clazz&JOBL_FOURTH))
//            return YES;
//        //trans-third classes (exl. fourth)
//        if (self.classes&ITEMJ_THIRD_UPPER && clazz&JOBL_THIRD && clazz&JOBL_UPPER && !(clazz&JOBL_FOURTH))
//            return YES;
//        //third-baby classes (exl. fourth)
//        if (self.classes&ITEMJ_THIRD_BABY && clazz&JOBL_THIRD && clazz&JOBL_BABY && !(clazz&JOBL_FOURTH))
//            return YES;
//        //fourth classes
//        if (self.classes&ITEMJ_FOURTH && clazz&JOBL_FOURTH)
//            return YES;
//    #endif
//
//        return NO;
//    }
}
