package org.allbinary.gdevelop.extensions.builtin.metadata;

/**
 *
 * @author User
 */
public class GDParameterFactory
{

    private static final GDParameterFactory instance = new GDParameterFactory();

    /**
     * @return the instance
     */
    public static GDParameterFactory getInstance()
    {
        return instance;
    }

    public final String OBJECT = "object";
    public final String OBJECT_PTR = "objectPtr";
    public final String OBJECT_LIST = "objectList";
    public final String OBJECT_LIST_WITHOUT_PICKING = "objectListWithoutPicking";

    public final String BEHAVIOR = "behavior";

    public final String NUMBER = "number";
    public final String EXPRESSION = "expression";
    public final String CAMERA = "camera";
    public final String FORCE_MULTIPLIER = "forceMultiplier";
    public final String STRING = "string";
    public final String LAYER = "layer";
    public final String COLOR = "color";
    public final String FILE = "file";
    public final String JOY_AXIS = "joyaxis";
    public final String STRING_WITH_SELECTOR = "stringWithSelector";
    public final String SCENE_NAME = "sceneName";
    public final String OBJECT_POINT_NAME = "objectPointName";
    public final String OBJECT_ANIMATION_NAME = "objectAnimationName";
    public final String VARIABLE = "variable";
    public final String OBJECT_VAR = "objectvar";
    public final String GLOBAL_VAR = "globalvar";
    public final String SCENE_VAR = "scenevar";

    public final String RELATIONAL_OPERATOR = "relationalOperator";

    public final String OPERATOR = "operator";

    public final String TRUE_OR_FALSE = "trueorfale";
    public final String YES_OR_NO = "yesorno";
    
    public final String get(final String parameterType)
    {
        if (parameterType.compareTo(this.OBJECT) == 0)
        {
            return this.OBJECT;
        } else if (parameterType.compareTo(this.OBJECT_PTR) == 0)
        {
            return this.OBJECT_PTR;
        } else if (parameterType.compareTo(this.OBJECT_LIST) == 0)
        {
            return this.OBJECT_LIST;
        } else if (parameterType.compareTo(this.OBJECT_LIST_WITHOUT_PICKING) == 0)
        {
            return this.OBJECT_LIST_WITHOUT_PICKING;
        } else if (parameterType.compareTo(this.BEHAVIOR) == 0)
        {
            return this.BEHAVIOR;
        } else if (parameterType.compareTo(this.NUMBER) == 0)
        {
            return this.NUMBER;
        } else if (parameterType.compareTo(this.EXPRESSION) == 0)
        {
            return this.EXPRESSION;
        } else if (parameterType.compareTo(this.CAMERA) == 0)
        {
            return this.CAMERA;
        } else if (parameterType.compareTo(this.FORCE_MULTIPLIER) == 0)
        {
            return this.FORCE_MULTIPLIER;
        } else if (parameterType.compareTo(this.STRING) == 0)
        {
            return this.STRING;
        } else if (parameterType.compareTo(this.LAYER) == 0)
        {
            return this.LAYER;
        } else if (parameterType.compareTo(this.COLOR) == 0)
        {
            return this.COLOR;
        } else if (parameterType.compareTo(this.FILE) == 0)
        {
            return this.FILE;
        } else if (parameterType.compareTo(this.JOY_AXIS) == 0)
        {
            return this.JOY_AXIS;
        } else if (parameterType.compareTo(this.STRING_WITH_SELECTOR) == 0)
        {
            return this.STRING_WITH_SELECTOR;
        } else if (parameterType.compareTo(this.SCENE_NAME) == 0)
        {
            return this.SCENE_NAME;
        } else if (parameterType.compareTo(this.OBJECT_POINT_NAME) == 0)
        {
            return this.OBJECT_POINT_NAME;
        } else if (parameterType.compareTo(this.OBJECT_ANIMATION_NAME) == 0)
        {
            return this.OBJECT_ANIMATION_NAME;
        } else if (parameterType.compareTo(this.VARIABLE) == 0)
        {
            return this.VARIABLE;
        } else if (parameterType.compareTo(this.OBJECT_VAR) == 0)
        {
            return this.OBJECT_VAR;
        } else if (parameterType.compareTo(this.GLOBAL_VAR) == 0)
        {
            return this.GLOBAL_VAR;
        } else if (parameterType.compareTo(this.SCENE_VAR) == 0)
        {
            return this.SCENE_VAR;
        } else if (parameterType.compareTo(this.RELATIONAL_OPERATOR) == 0)
        {
            return this.RELATIONAL_OPERATOR;
        } else
        {
            throw new RuntimeException();
            //return null;
        }
    }

    public boolean isObject(final String parameterType)
    {
        return parameterType == this.OBJECT
                || parameterType == this.OBJECT_PTR
                || parameterType == this.OBJECT_LIST
                || parameterType == this.OBJECT_LIST_WITHOUT_PICKING;
    }

    public boolean isBehavior(final String parameterType)
    {
        return parameterType == BEHAVIOR;
    }

    public boolean isExpression(final String type, final String parameterType)
    {
        if (type == NUMBER)
        {
            return parameterType == EXPRESSION || parameterType == CAMERA
                    || parameterType == FORCE_MULTIPLIER;
        } else if (type == "string")
        {
            return parameterType == STRING || parameterType == LAYER
                    || parameterType == COLOR || parameterType == FILE
                    || parameterType == JOY_AXIS
                    || parameterType == STRING_WITH_SELECTOR
                    || parameterType == SCENE_NAME
                    || parameterType == OBJECT_POINT_NAME
                    || parameterType == OBJECT_ANIMATION_NAME;
        } else if (type == VARIABLE)
        {
            return parameterType == OBJECT_VAR || parameterType == GLOBAL_VAR
                    || parameterType == SCENE_VAR;
        }
        return false;
    }

}
