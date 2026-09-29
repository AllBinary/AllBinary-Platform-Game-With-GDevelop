/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../../java/lang/Object.js';
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDEventTypeFactory extends Object {
    constructor() {
        super(...arguments);
        this.COMMENT = "BuiltinCommonInstructions::Comment";
        this.FOR_EACH = "BuiltinCommonInstructions::ForEach";
        this.FOR_EACH_CHILD = "BuiltinCommonInstructions::ForEachChild";
        this.GROUP = "BuiltinCommonInstructions::Group";
        this.LINK = "BuiltinCommonInstructions::Link";
        this.REPEAT = "BuiltinCommonInstructions::Repeat";
        this.STANDARD = "BuiltinCommonInstructions::Standard";
        this.WHILE = "BuiltinCommonInstructions::While";
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDEventTypeFactory.instance;
    }
    get(type) {
        if (type.compareTo(this.COMMENT) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.COMMENT;
        }
        else if (type.compareTo(this.FOR_EACH) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.FOR_EACH;
        }
        else if (type.compareTo(this.FOR_EACH_CHILD) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.FOR_EACH_CHILD;
        }
        else if (type.compareTo(this.GROUP) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.GROUP;
        }
        else if (type.compareTo(this.LINK) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.LINK;
        }
        else if (type.compareTo(this.REPEAT) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.REPEAT;
        }
        else if (type.compareTo(this.STANDARD) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.STANDARD;
        }
        else if (type.compareTo(this.WHILE) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.WHILE;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return null;
    }
}
GDEventTypeFactory.instance = new GDEventTypeFactory();
