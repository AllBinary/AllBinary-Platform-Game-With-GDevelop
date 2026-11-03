/* Generated Code Do Not Modify */
import { Object } from '../../../../../../java/lang/Object.js';
import { RuntimeException } from '../../../../../../java/lang/RuntimeException.js';
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDParameterFactory extends Object {
    constructor() {
        super(...arguments);
        this.OBJECT = "anyType";
        this.OBJECT_PTR = "objectPtr";
        this.OBJECT_LIST = "objectList";
        this.OBJECT_LIST_WITHOUT_PICKING = "objectListWithoutPicking";
        this.BEHAVIOR = "behavior";
        this.NUMBER = "number";
        this.EXPRESSION = "expression";
        this.CAMERA = "camera";
        this.FORCE_MULTIPLIER = "forceMultiplier";
        this.STRING = "string";
        this.LAYER = "layer";
        this.COLOR = "color";
        this.FILE = "file";
        this.JOY_AXIS = "joyaxis";
        this.STRING_WITH_SELECTOR = "stringWithSelector";
        this.SCENE_NAME = "sceneName";
        this.OBJECT_POINT_NAME = "objectPointName";
        this.OBJECT_ANIMATION_NAME = "objectAnimationName";
        this.VARIABLE = "variable";
        this.OBJECT_VAR = "objectvar";
        this.GLOBAL_VAR = "globalvar";
        this.SCENE_VAR = "scenevar";
        this.RELATIONAL_OPERATOR = "relationalOperator";
        this.OPERATOR = "operator";
        this.TRUE_OR_FALSE = "trueorfale";
        this.YES_OR_NO = "yesorno";
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDParameterFactory.instance;
    }
    get(parameterType) {
        if (parameterType.compareTo(this.OBJECT) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.OBJECT;
        }
        else if (parameterType.compareTo(this.OBJECT_PTR) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.OBJECT_PTR;
        }
        else if (parameterType.compareTo(this.OBJECT_LIST) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.OBJECT_LIST;
        }
        else if (parameterType.compareTo(this.OBJECT_LIST_WITHOUT_PICKING) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.OBJECT_LIST_WITHOUT_PICKING;
        }
        else if (parameterType.compareTo(this.BEHAVIOR) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.BEHAVIOR;
        }
        else if (parameterType.compareTo(this.NUMBER) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.NUMBER;
        }
        else if (parameterType.compareTo(this.EXPRESSION) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.EXPRESSION;
        }
        else if (parameterType.compareTo(this.CAMERA) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.CAMERA;
        }
        else if (parameterType.compareTo(this.FORCE_MULTIPLIER) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.FORCE_MULTIPLIER;
        }
        else if (parameterType.compareTo(this.STRING) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.STRING;
        }
        else if (parameterType.compareTo(this.LAYER) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.LAYER;
        }
        else if (parameterType.compareTo(this.COLOR) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.COLOR;
        }
        else if (parameterType.compareTo(this.FILE) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.FILE;
        }
        else if (parameterType.compareTo(this.JOY_AXIS) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.JOY_AXIS;
        }
        else if (parameterType.compareTo(this.STRING_WITH_SELECTOR) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.STRING_WITH_SELECTOR;
        }
        else if (parameterType.compareTo(this.SCENE_NAME) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.SCENE_NAME;
        }
        else if (parameterType.compareTo(this.OBJECT_POINT_NAME) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.OBJECT_POINT_NAME;
        }
        else if (parameterType.compareTo(this.OBJECT_ANIMATION_NAME) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.OBJECT_ANIMATION_NAME;
        }
        else if (parameterType.compareTo(this.VARIABLE) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.VARIABLE;
        }
        else if (parameterType.compareTo(this.OBJECT_VAR) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.OBJECT_VAR;
        }
        else if (parameterType.compareTo(this.GLOBAL_VAR) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.GLOBAL_VAR;
        }
        else if (parameterType.compareTo(this.SCENE_VAR) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.SCENE_VAR;
        }
        else if (parameterType.compareTo(this.RELATIONAL_OPERATOR) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.RELATIONAL_OPERATOR;
        }
        else {
            throw new RuntimeException();
        }
    }
    isObject(parameterType) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return parameterType == this.OBJECT || parameterType == this.OBJECT_PTR || parameterType == this.OBJECT_LIST || parameterType == this.OBJECT_LIST_WITHOUT_PICKING;
    }
    isBehavior(parameterType) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return parameterType == this.BEHAVIOR;
    }
    isExpression(type, parameterType) {
        if (type == this.NUMBER) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return parameterType == this.EXPRESSION || parameterType == this.CAMERA || parameterType == this.FORCE_MULTIPLIER;
        }
        else if (type == "string") {
            //if statement needs to be on the same line and ternary does not work the same way.
            return parameterType == this.STRING || parameterType == this.LAYER || parameterType == this.COLOR || parameterType == this.FILE || parameterType == this.JOY_AXIS || parameterType == this.STRING_WITH_SELECTOR || parameterType == this.SCENE_NAME || parameterType == this.OBJECT_POINT_NAME || parameterType == this.OBJECT_ANIMATION_NAME;
        }
        else if (type == this.VARIABLE) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return parameterType == this.OBJECT_VAR || parameterType == this.GLOBAL_VAR || parameterType == this.SCENE_VAR;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
}
GDParameterFactory.instance = new GDParameterFactory();
