/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDTypeFactory extends Object {
    constructor() {
        super(...arguments);
        this.STRING = "String";
        this.NUMBER = "Number";
        this.BOOLEAN = "Boolean";
        this.STRUCTURE = "Structure";
        this.ARRAY = "Array";
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDTypeFactory.instance;
    }
    get(type) {
        if (this.STRING.compareTo(type) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.STRING;
        }
        else if (this.NUMBER.compareTo(type) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.NUMBER;
        }
        else if (this.BOOLEAN.compareTo(type) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.BOOLEAN;
        }
        else if (this.STRUCTURE.compareTo(type) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.STRUCTURE;
        }
        else if (this.ARRAY.compareTo(type) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.ARRAY;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return null;
    }
    isPrimitive(type) {
        if (this.STRING == type) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        else if (this.NUMBER == type) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        else if (this.BOOLEAN == type) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
}
GDTypeFactory.instance = new GDTypeFactory();
