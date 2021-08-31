/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin;

import org.allbinary.gdevelop.extensions.GDPlatformExtension;
import org.allbinary.gdevelop.extensions.builtin.metadata.GDBehaviorMetadata;
import org.allbinary.gdevelop.extensions.builtin.metadata.GDParameterFactory;
import org.allbinary.logic.basic.string.StringUtil;

/**
 *
 * @author User
 */
public class GDIdeBaseObjectExtension
{

    private static final String OBJECT = "Object";

    private final GDParameterFactory parameterFactory = GDParameterFactory.getInstance();
    private final StringUtil stringUtil = StringUtil.getInstance();

    public final GDPlatformExtension platformExtension = GDPlatformExtension.getInstance();
    public final GDBehaviorMetadata behaviorMetadata = new GDBehaviorMetadata(
            stringUtil.EMPTY_STRING,
            stringUtil.EMPTY_STRING,
            stringUtil.EMPTY_STRING,
            stringUtil.EMPTY_STRING,
            stringUtil.EMPTY_STRING,
            stringUtil.EMPTY_STRING,
            stringUtil.EMPTY_STRING,
            stringUtil.EMPTY_STRING,
            null,
            null);

    public GDIdeBaseObjectExtension()
    {
//        platformExtension.SetExtensionInformation(
//                "BuiltinObject",
//                "Features for all objects",
//                "Common features that can be used for all objects in GDevelop.",
//                "Florian Rival",
//                "Open source (MIT License)")
//                .SetExtensionHelpPath("/objects/base_object/events");

        //GDObjectMetadata& obj = platformExtension.AddObject<gd::Object>(this.stringUtil.EMPTY_STRING, "Base object", "Base object", "res/objeticon24.png");
        behaviorMetadata.addCondition("PosX",
                "X position",
                "Compare the X position of the object.",
                "the X position",
                "Position",
                "res/conditions/position24.png",
                "res/conditions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardRelationalOperatorParameters(this.parameterFactory.NUMBER)
                .markAsSimple();

        behaviorMetadata.addAction("MettreX",
                "X position",
                "Change the X position of an object.",
                "the X position",
                "Position",
                "res/actions/position24.png",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardOperatorParameters(this.parameterFactory.NUMBER)
                .markAsSimple();

        behaviorMetadata.addCondition("PosY",
                "Y position",
                "Compare the Y position of an object.",
                "the Y position",
                "Position",
                "res/conditions/position24.png",
                "res/conditions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardRelationalOperatorParameters(this.parameterFactory.NUMBER)
                .markAsSimple();

        behaviorMetadata.addAction("MettreY",
                "Y position",
                "Change the Y position of an object.",
                "the Y position",
                "Position",
                "res/actions/position24.png",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardOperatorParameters(this.parameterFactory.NUMBER)
                .markAsSimple();

        behaviorMetadata.addAction("MettreXY",
                "Position",
                "Change the position of an object.",
                "Change the position of _PARAM0_: _PARAM1_ _PARAM2_ (x axis, _PARAM3_ _PARAM4_ (y axis)",
                "Position",
                "res/actions/position24.png",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OPERATOR, "Modification's sign", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OPERATOR, "Modification's sign", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position", stringUtil.EMPTY_STRING, false)
                .markAsSimple();

        behaviorMetadata.addAction("SetCenter",
                "Center position",
                "Change the position of an object, using its center.",
                "Change the position of the center of _PARAM0_: _PARAM1_ _PARAM2_ (x axis, _PARAM3_ _PARAM4_ (y axis)",
                "Position/Center",
                "res/actions/position24.png",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OPERATOR, "Modification's sign", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OPERATOR, "Modification's sign", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position", stringUtil.EMPTY_STRING, false)
                .markAsSimple();

        behaviorMetadata.addExpressionAndConditionAndAction(this.parameterFactory.NUMBER, "CenterX",
                "Center X position",
                "the X position of the center",
                "the X position of the center",
                "Position/Center",
                "res/actions/position24.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardParameters(this.parameterFactory.NUMBER);

        behaviorMetadata.addExpressionAndConditionAndAction(this.parameterFactory.NUMBER, "CenterY",
                "Center Y position",
                "the Y position of the center",
                "the Y position of the center",
                "Position/Center",
                "res/actions/position24.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardParameters(this.parameterFactory.NUMBER);

        behaviorMetadata.addAction("MettreAutourPos",
                "Put around a position",
                "Position the center of the given object around a position, using the specified angle and distance.",
                "Put _PARAM0_ around _PARAM1_;_PARAM2_, with an angle of _PARAM4_ degrees and _PARAM3_ pixels distance.",
                "Position",
                "res/actions/positionAutour24.png",
                "res/actions/positionAutour.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Distance", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angle, in degrees", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction("SetAngle",
                "Angle",
                "Change the angle of rotation of an object.",
                "the angle",
                "Angle",
                "res/actions/direction24.png",
                "res/actions/direction.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardOperatorParameters(this.parameterFactory.NUMBER);

        behaviorMetadata.addAction("Rotate",
                "Rotate",
                "Rotate an object, clockwise if the speed is positive, counterclockwise otherwise.",
                "Rotate _PARAM0_ at speed _PARAM1_deg/second",
                "Angle",
                "res/actions/direction24.png",
                "res/actions/direction.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angular speed (in degrees per second)", stringUtil.EMPTY_STRING, false)
                .addCodeOnlyParameter("currentScene", stringUtil.EMPTY_STRING)
                .markAsSimple();

        behaviorMetadata.addAction(
                "RotateTowardAngle",
                "Rotate toward angle",
                "Rotate an object towards an angle with the specified speed.",
                "Rotate _PARAM0_ towards _PARAM1_ at speed _PARAM2_deg/second",
                "Angle",
                "res/actions/direction24.png",
                "res/actions/direction.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angle to rotate towards (in degrees)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angular speed (in degrees per second)", stringUtil.EMPTY_STRING, false)
                .setParameterLongDescription("Enter 0 for an immediate rotation.")
                .addCodeOnlyParameter("currentScene", this.stringUtil.EMPTY_STRING);

        behaviorMetadata.addAction(
                "RotateTowardPosition",
                "Rotate toward position",
                "Rotate an object towards a position, with the specified speed.",
                "Rotate _PARAM0_ towards _PARAM1_;_PARAM2_ at speed _PARAM3_deg/second",
                "Angle",
                "res/actions/direction24.png",
                "res/actions/direction.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angular speed (in degrees per second)", stringUtil.EMPTY_STRING, false)
                .setParameterLongDescription("Enter 0 for an immediate rotation.")
                .addCodeOnlyParameter("currentScene", this.stringUtil.EMPTY_STRING)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "AddForceXY",
                "Add a force",
                "Add a force to an object. The object will move according to all of the forces it has.",
                "Add to _PARAM0_ _PARAM3_ force of _PARAM1_ p/s on X axis and _PARAM2_ p/s on Y axis",
                "Movement using forces",
                "res/actions/force24.png",
                "res/actions/force.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Speed on X axis (in pixels per second)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Speed on Y axis (in pixels per second)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.FORCE_MULTIPLIER, "Force multiplier", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addAction("AddForceAL",
                "Add a force (angle)",
                "Add a force to an object. The object will move according to all of the forces it has. This action creates the force using the specified angle and length.",
                "Add to _PARAM0_ _PARAM3_ force, angle: _PARAM1_ degrees and length: _PARAM2_ pixels",
                "Movement using forces",
                "res/actions/force24.png",
                "res/actions/force.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angle", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Speed (in pixels per second)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.FORCE_MULTIPLIER, "Force multiplier", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "AddForceVersPos",
                "Add a force to move toward a position",
                "Add a force to an object to make it move toward a position.",
                "Move _PARAM0_ toward _PARAM1_;_PARAM2_ with _PARAM4_ force of _PARAM3_ pixels",
                "Movement using forces",
                "res/actions/force24.png",
                "res/actions/force.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Speed (in pixels per second)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.FORCE_MULTIPLIER, "Force multiplier", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "AddForceTournePos",
                "Add a force to move around a position",
                "Add a force to an object to make it rotate around a position.\nNote that the movement is not precise, "
                + "especially if the speed is high.\nTo position an object around a position more precisely, "
                + "use the actions in the category \"Position\".",
                "Rotate _PARAM0_ around _PARAM1_;_PARAM2_ at _PARAM3_ deg/sec and _PARAM4_ pixels away",
                "Movement using forces",
                "res/actions/forceTourne24.png",
                "res/actions/forceTourne.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "X position of the center", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position of the center", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Speed (in Degrees per seconds)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Distance (in pixels)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.FORCE_MULTIPLIER, "Force multiplier", stringUtil.EMPTY_STRING, false)
                .setHidden();

        behaviorMetadata.addAction("Arreter",
                "Stop the object",
                "Stop the object by deleting all of its forces.",
                "Stop _PARAM0_ (remove all forces)",
                "Movement using forces",
                "res/actions/arreter24.png",
                "res/actions/arreter.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction("Delete",
                "Delete the object",
                "Delete the specified object.",
                "Delete _PARAM0_",
                "Objects",
                "res/actions/delete24.png",
                "res/actions/delete.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addCodeOnlyParameter("currentScene", this.stringUtil.EMPTY_STRING)
                .markAsSimple();

        behaviorMetadata.addAction("ChangePlan",
                "Z order",
                "Modify the Z-order of an object",
                "the z-order",
                "Z order",
                "res/actions/planicon24.png",
                "res/actions/planicon.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardOperatorParameters(this.parameterFactory.NUMBER);

        behaviorMetadata.addAction("ChangeLayer",
                "Layer",
                "Move the object to a different layer.",
                "Put _PARAM0_ on the layer _PARAM1_",
                "Layers and cameras",
                "res/actions/layer24.png",
                "res/actions/layer.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.LAYER, "Move it to this layer (base layer if empty)", stringUtil.EMPTY_STRING, false)
                .setDefaultValue("\"\"")
                .markAsAdvanced();

        behaviorMetadata.addAction("ModVarObjet",
                "Value of an object variable",
                "Change the value of an object variable.",
                "the variable _PARAM1_",
                "Variables",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .useStandardOperatorParameters(this.parameterFactory.NUMBER);

        behaviorMetadata.addAction(
                "ModVarObjetTxt",
                "Text of an object variable",
                "Change the text of an object variable.",
                "the text of variable _PARAM1_",
                "Variables",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .useStandardOperatorParameters("string");

        behaviorMetadata.addAction(
                "SetObjectVariableAsBoolean",
                "Boolean value of an object variable",
                "Change the boolean value of an object variable.",
                "Set the boolean value of the variable _PARAM1_ of object _PARAM0_ to _PARAM2_",
                "Variables",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.TRUE_OR_FALSE, "New Value:", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addAction(
                "ToggleObjectVariableAsBoolean",
                "Toggle the boolean value of an object variable",
                "Toggles the boolean value of an object variable."
                + "\nIf it was true, it will become false, and if it was false it will become true.",
                "Toggle the boolean value of the variable _PARAM1_ of object _PARAM0_",
                "Variables",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addCondition("ObjectVariableChildExists",
                "Child existence",
                "Check if the specified child of the variable exists.",
                "Child _PARAM2_ of variable _PARAM1_ of _PARAM0_ exists",
                "Variables/Collections/Structures",
                "res/conditions/var24.png",
                "res/conditions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Name of the child", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction("ObjectVariableRemoveChild",
                "Remove a child",
                "Remove a child from an object variable.",
                "Remove child _PARAM2_ from variable _PARAM1_ of _PARAM0_",
                "Variables/Collections/Structures",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Child's name", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction("ObjectVariableClearChildren",
                "Clear variable",
                "Remove all the children from the object variable.",
                "Clear children from variable _PARAM1_ of _PARAM0_",
                "Variables/Collections",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction("Cache",
                "Hide",
                "Hide the specified object.",
                "Hide _PARAM0_",
                "Visibility",
                "res/actions/visibilite24.png",
                "res/actions/visibilite.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .markAsSimple();

        behaviorMetadata.addAction("Montre",
                "Show",
                "Show the specified object.",
                "Show _PARAM0_",
                "Visibility",
                "res/actions/visibilite24.png",
                "res/actions/visibilite.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addCodeOnlyParameter("inlineCode", "false")
                .markAsSimple();

        behaviorMetadata.addCondition("Angle",
                "Angle",
                "Compare the angle of the specified object.",
                "the angle (in degrees)",
                "Angle",
                "res/conditions/direction24.png",
                "res/conditions/direction.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardRelationalOperatorParameters(this.parameterFactory.NUMBER)
                .markAsAdvanced();

        behaviorMetadata.addCondition("Plan",
                "Z-order",
                "Compare the Z-order of the specified object.",
                "the Z-order",
                "Z-order",
                "res/conditions/planicon24.png",
                "res/conditions/planicon.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardRelationalOperatorParameters(this.parameterFactory.NUMBER)
                .markAsAdvanced();

        behaviorMetadata.addCondition("Layer",
                "Current layer",
                "Check if the object is on the specified layer.",
                "_PARAM0_ is on layer _PARAM1_",
                "Layer",
                "res/conditions/layer24.png",
                "res/conditions/layer.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.LAYER, "Layer", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addCondition("Visible",
                "Visibility",
                "Check if an object is visible.",
                "_PARAM0_ is visible (not marked as hidden)",
                "Visibility",
                "res/conditions/visibilite24.png",
                "res/conditions/visibilite.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .markAsSimple();

        behaviorMetadata.addCondition("Invisible",
                "Invisibility of an object",
                "Check if an object is hidden.",
                "_PARAM0_ is hidden",
                "Visibility",
                "res/conditions/visibilite24.png",
                "res/conditions/visibilite.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .setHidden();

        behaviorMetadata.addCondition("Arret",
                "Object is stopped (no forces applied on it)",
                "Check if an object is not moving",
                "_PARAM0_ is stopped",
                "Movement using forces",
                "res/conditions/arret24.png",
                "res/conditions/arret.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addCondition("Vitesse",
                "Speed (from forces)",
                "Compare the overall speed of an object",
                "the overall speed",
                "Movement using forces",
                "res/conditions/vitesse24.png",
                "res/conditions/vitesse.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardRelationalOperatorParameters(this.parameterFactory.NUMBER)
                .markAsAdvanced();

        behaviorMetadata.addCondition("AngleOfDisplacement",
                "Angle of movement (using forces)",
                "Compare the angle of movement of an object according to the forces applied on it.",
                "Angle of movement of _PARAM0_ is _PARAM1_ (tolerance: _PARAM2_ degrees)",
                "Movement using forces",
                "res/conditions/vitesse24.png",
                "res/conditions/vitesse.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angle, in degrees", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Tolerance, in degrees", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addCondition("VarObjet",
                "Value of an object variable",
                "Compare the value of an object variable.",
                "the variable _PARAM1_",
                "Variables",
                "res/conditions/var24.png",
                "res/conditions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .useStandardRelationalOperatorParameters(this.parameterFactory.NUMBER);

        behaviorMetadata.addCondition("VarObjetTxt",
                "Text of an object variable",
                "Compare the text of an object variable.",
                "the text of variable _PARAM1_",
                "Variables",
                "res/conditions/var24.png",
                "res/conditions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .useStandardRelationalOperatorParameters("string");

        behaviorMetadata.addCondition("ObjectVariableAsBoolean",
                "Boolean value of an object variable",
                "Compare the boolean value of an object variable.",
                "The boolean value of variable _PARAM1_ of object _PARAM0_ is _PARAM2_",
                "Variables",
                "res/conditions/var24.png",
                "res/conditions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.TRUE_OR_FALSE, "Check if the value is", stringUtil.EMPTY_STRING, false)
                .setDefaultValue("true");

        behaviorMetadata.addCondition("VarObjetDef",
                "Variable defined",
                "Check if the variable is defined.",
                "Variable _PARAM1 of _PARAM0_ is defined",
                "Variables",
                "res/conditions/var24.png",
                "res/conditions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Variable", stringUtil.EMPTY_STRING, false)
                .setHidden();

        behaviorMetadata.addAction(
                "ObjectVariablePush",
                "Append variable to an object array",
                "Appends a variable to the end of an object array variable.",
                "Append variable _PARAM2_ to array variable _PARAM1_ of _PARAM0_",
                "Variables/Collections/Arrays",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Array variable", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.SCENE_VAR, "Scene variable with the content to append", stringUtil.EMPTY_STRING, false)
                .setParameterLongDescription("The content of the variable will *be copied* and appended at the end of the array.")
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "ObjectVariablePushString",
                "Append a string to an object array",
                "Appends a string to the end of an object array variable.",
                "Append string _PARAM2_ to array variable _PARAM1_ of _PARAM0_",
                "Variables/Collections/Arrays",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Array variable", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "String to append", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "ObjectVariablePushNumber",
                "Append a number to an object array",
                "Appends a number to the end of an object array variable.",
                "Append number _PARAM2_ to array variable _PARAM1_ of _PARAM0_",
                "Variables/Collections/Arrays",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Array variable", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Number to append", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "ObjectVariablePushBool",
                "Append a boolean to an object array",
                "Appends a boolean to the end of an object array variable.",
                "Append boolean _PARAM2_ to array variable _PARAM1_ of _PARAM0_",
                "Variables/Collections/Arrays",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Array variable", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.TRUE_OR_FALSE, "Boolean to append", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "ObjectVariableRemoveAt",
                "Remove variable from an object array (by index)",
                "Removes a variable at the specified index of an object array variable.",
                "Remove variable at index _PARAM2_ from array variable _PARAM1_ of _PARAM0_",
                "Variables/Collections/Arrays",
                "res/actions/var24.png",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Index to remove", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addCondition("BehaviorActivated",
                "Behavior activated",
                "Check if the behavior is activated for the object.",
                "Behavior _PARAM1_ of _PARAM0_ is activated",
                "Behaviors",
                "res/behavior24.png",
                "res/behavior16.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.BEHAVIOR, "Behavior", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction("ActivateBehavior",
                "De/activate a behavior",
                "De/activate the behavior for the object.",
                "Activate behavior _PARAM1_ of _PARAM0_: _PARAM2_",
                "Behaviors",
                "res/behavior24.png",
                "res/behavior16.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.BEHAVIOR, "Behavior", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.YES_OR_NO, "Activate?", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "AddForceVers",
                "Add a force to move toward an object",
                "Add a force to an object to make it move toward another.",
                "Move _PARAM0_ toward _PARAM1_ with _PARAM3_ force of _PARAM2_ pixels",
                "Movement using forces",
                "res/actions/forceVers24.png",
                "res/actions/forceVers.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_PTR, "Target Object", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Speed (in pixels per second)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.FORCE_MULTIPLIER, "Force multiplier", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "AddForceTourne",
                "Add a force to move around an object",
                "Add a force to an object to make it rotate around another.\nNote that the movement is not precise, "
                + "especially if the speed is high.\nTo position an object around a position more precisely, use the actions in category \"Position\".",
                "Rotate _PARAM0_ around _PARAM1_ at _PARAM2_ deg/sec and _PARAM3_ pixels away",
                "Movement using forces",
                "res/actions/forceTourne24.png",
                "res/actions/forceTourne.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_PTR, "Rotate around this object", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Speed (in degrees per second)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Distance (in pixels)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.FORCE_MULTIPLIER, "Force multiplier", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "MettreAutour",
                "Put the object around another",
                "Position an object around another, with the specified angle and distance. The center of the objects are used for positioning them.",
                "Put _PARAM0_ around _PARAM1_, with an angle of _PARAM3_ degrees and _PARAM2_ pixels distance.",
                "Position",
                "res/actions/positionAutour24.png",
                "res/actions/positionAutour.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_PTR, "\"Center\" Object", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Distance", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angle, in degrees", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        // Deprecated action
        behaviorMetadata.addAction(
                "Rebondir",
                "Move an object away from another",
                "Move an object away from another, using forces.",
                "Move _PARAM0_ away from _PARAM1_ (only _PARAM0_ will move)",
                "Movement using forces",
                "res/actions/ecarter24.png",
                "res/actions/ecarter.png")
                .setHidden()
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_LIST, "Object 2 (won't move)", stringUtil.EMPTY_STRING, false);

        // Deprecated action
        behaviorMetadata.addAction(
                "Ecarter",
                "Move an object away from another",
                "Move an object away from another without using forces.",
                "Move _PARAM0_ away from _PARAM2_ (only _PARAM0_ will move)",
                "Position",
                "res/actions/ecarter24.png",
                "res/actions/ecarter.png")
                .setHidden()
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_LIST, "Object 2 (won't move)", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addAction(
                "SeparateFromObjects",
                "Separate objects",
                "Move an object away from another using their collision masks.\nBe sure to call this action on a reasonable number of objects\nto avoid slowing down the game.",
                "Move _PARAM0_ away from _PARAM1_ (only _PARAM0_ will move)",
                "Position",
                "res/actions/ecarter24.png",
                "res/actions/ecarter.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_LIST, "Objects (won't move)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.YES_OR_NO, "Ignore objects that are touching each other on their edges, but are not overlapping (default: no)", this.stringUtil.EMPTY_STRING, true)
                .setDefaultValue("no")
                .markAsSimple();

        behaviorMetadata.addCondition(
                "CollisionPoint",
                "Point inside object",
                "Test if a point is inside the object collision masks.",
                "_PARAM1_;_PARAM2_ is inside _PARAM0_",
                "Collision",
                "res/conditions/collisionPoint24.png",
                "res/conditions/collisionPoint.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "X position of the point", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position of the point", stringUtil.EMPTY_STRING, false)
                .markAsSimple();

        platformExtension.addCondition(
                "SourisSurObjet",
                "The cursor/touch is on an object",
                "Test if the cursor is over an object, or if the object is being touched.",
                "The cursor/touch is on _PARAM0_",
                "Mouse and touch",
                "res/conditions/surObjet24.png",
                "res/conditions/surObjet.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .addCodeOnlyParameter("currentScene", this.stringUtil.EMPTY_STRING)
                .addParameter(this.parameterFactory.YES_OR_NO, "Accurate test (yes by default)", this.stringUtil.EMPTY_STRING, true)
                .setDefaultValue("yes")
                .addCodeOnlyParameter("conditionInverted", this.stringUtil.EMPTY_STRING)
                .markAsSimple();

        behaviorMetadata.addCondition(
                "ObjectTimer",
                "Value of a timer",
                "Test the elapsed time of a timer.",
                "The timer _PARAM1_ of _PARAM0_ is greater than _PARAM2_ seconds",
                "Timers",
                "res/conditions/timer24.png",
                "res/conditions/timer.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Timer's name", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Time in seconds", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addCondition(
                "ObjectTimerPaused",
                "Timer paused",
                "Test if specified timer is paused.",
                "The timer _PARAM1_ of _PARAM0_ is paused",
                "Timers",
                "res/conditions/timerPaused24.png",
                "res/conditions/timerPaused.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Timer's name", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "ResetObjectTimer",
                "Start (or reset) a timer",
                "Reset the specified timer, if the timer doesn't exist it's created and started.",
                "Reset the timer _PARAM1_ of _PARAM0_",
                "Timers",
                "res/actions/timer24.png",
                "res/actions/timer.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Timer's name", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addAction(
                "PauseObjectTimer",
                "Pause a timer",
                "Pause a timer.",
                "Pause timer _PARAM1_ of _PARAM0_",
                "Timers",
                "res/actions/pauseTimer24.png",
                "res/actions/pauseTimer.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Timer's name", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "UnPauseObjectTimer",
                "Unpause a timer",
                "Unpause a timer.",
                "Unpause timer _PARAM1_ of _PARAM0_",
                "Timers",
                "res/actions/unPauseTimer24.png",
                "res/actions/unPauseTimer.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Timer's name", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addAction(
                "RemoveObjectTimer",
                "Delete a timer",
                "Delete a timer from memory.",
                "Delete timer _PARAM1_ of _PARAM0_ from memory",
                "Timers",
                "res/actions/timer24.png",
                "res/actions/timer.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Timer's name", stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        behaviorMetadata.addExpression(
                "X",
                "X position",
                "X position of the object",
                "Position",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "Y",
                "Y position",
                "Y position of the object",
                "Position",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "Angle",
                "Angle",
                "Current angle, in degrees, of the object",
                "Angle",
                "res/actions/direction.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "ForceX",
                "X coordinate of the sum of forces",
                "X coordinate of the sum of forces",
                "Movement using forces",
                "res/actions/force.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "ForceY",
                "Y coordinate of the sum of forces",
                "Y coordinate of the sum of forces",
                "Movement using forces",
                "res/actions/force.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "ForceAngle",
                "Angle of the sum of forces",
                "Angle of the sum of forces",
                "Movement using forces",
                "res/actions/force.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "ForceLength",
                "Length of the sum of forces",
                "Length of the sum of forces",
                "Movement using forces",
                "res/actions/force.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "Longueur",
                "Length of the sum of forces",
                "Length of the sum of forces",
                "Movement using forces",
                "res/actions/force.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .setHidden();

        behaviorMetadata.addExpression(
                "Width",
                "Width",
                "Width of the object",
                "Size",
                "res/actions/scaleWidth.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "Largeur",
                "Width",
                "Width of the object",
                "Size",
                "res/actions/scaleWidth.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .setHidden();

        behaviorMetadata.addExpression(
                "Height",
                "Height",
                "Height of the object",
                "Size",
                "res/actions/scaleHeight.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "Hauteur",
                "Height",
                "Height of the object",
                "Size",
                "res/actions/scaleHeight.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .setHidden();

        behaviorMetadata.addExpression(
                "ZOrder",
                "Z-order",
                "Z-order of an object",
                "Visibility",
                "res/actions/planicon.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "Plan",
                "Z-order",
                "Z-order of an object",
                "Visibility",
                "res/actions/planicon.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .setHidden();

        behaviorMetadata.addExpression(
                "Distance",
                "Distance between two objects",
                "Distance between two objects",
                "Position",
                "res/conditions/distance.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_PTR, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "SqDistance",
                "Square distance between two objects",
                "Square distance between two objects",
                "Position",
                "res/conditions/distance.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_PTR, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "DistanceToPosition",
                "Distance between an object and a position",
                "Distance between an object and a position",
                "Position",
                "res/conditions/distance.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Target X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Target Y position", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "SqDistanceToPosition",
                "Square distance between an object and a position",
                "Square distance between an object and a position",
                "Position",
                "res/conditions/distance.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Target X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Target Y position", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "Variable",
                "Object variable",
                "Value of an object variable",
                "Variables",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "VariableChildCount",
                "Number of children of an object variable",
                "Number of children of an object variable",
                "Variables",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addStrExpression(
                "VariableString",
                "Object variable",
                "Text of an object variable",
                "Variables",
                "res/actions/var.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_VAR, "Variable", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "ObjectTimerElapsedTime",
                "Timer value",
                "Value of a timer",
                "Timers",
                "res/actions/time.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.STRING, "Timer's name", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "AngleToObject",
                "Angle between two objects",
                "Compute the angle between two objects. If you need the angle to an arbitrary position, use AngleToPosition.",
                "Angle",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_PTR, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "XFromAngleAndDistance",
                "X position from angle and distance",
                "Compute the X position when given an angle and distance relative to the starting object. "
                + "This is also known as getting the cartesian coordinates of a 2D vector, using its polar coordinates.",
                "Position",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angle, in degrees", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Distance", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "YFromAngleAndDistance",
                "Y position from angle and distance",
                "Compute the Y position when given an angle and distance relative to the starting object. "
                + "This is also known as getting the cartesian coordinates of a 2D vector, using its polar coordinates.",
                "Position",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Angle, in degrees", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Distance", stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addExpression(
                "AngleToPosition",
                "Angle between an object and a position",
                "Compute the angle between the object center and a \"target\" position. If you need the angle between two objects, use AngleToObject.",
                "Angle",
                "res/actions/position.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Target X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Target Y position", stringUtil.EMPTY_STRING, false);

        this.platformExtension
                .addAction("Create",
                        "Create an object",
                        "Create an object at specified position",
                        "Create object _PARAM1_ at position _PARAM2_;_PARAM3_",
                        "Objects",
                        "res/actions/create24.png",
                        "res/actions/create.png")
                .addCodeOnlyParameter("objectsContext", this.stringUtil.EMPTY_STRING)
                .addParameter(this.parameterFactory.OBJECT_LIST_WITHOUT_PICKING, "Object to create", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.LAYER, "Layer (base layer if empty)", this.stringUtil.EMPTY_STRING, true)
                .setDefaultValue("\"\"")
                .markAsSimple();

        this.platformExtension
                .addAction("CreateByName",
                        "Create an object from its name",
                        "Among the objects of the specified group, this action will create the object with the specified name.",
                        "Among objects _PARAM1_, create object named _PARAM2_ at position _PARAM3_;_PARAM4_",
                        "Objects",
                        "res/actions/create24.png",
                        "res/actions/create.png")
                .addCodeOnlyParameter("objectsContext", this.stringUtil.EMPTY_STRING)
                .addParameter(this.parameterFactory.OBJECT_LIST_WITHOUT_PICKING, "Group of potential objects", stringUtil.EMPTY_STRING, false)
                .setParameterLongDescription("Group containing objects that can be created by the action.")
                .addParameter(this.parameterFactory.STRING, "Name of the object to create", stringUtil.EMPTY_STRING, false)
                .setParameterLongDescription("Text representing the name of the object to create. If no objects with this name are found in the group, no object will be created.")
                .addParameter(this.parameterFactory.EXPRESSION, "X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.LAYER, "Layer (base layer if empty)", this.stringUtil.EMPTY_STRING, true)
                .setDefaultValue("\"\"")
                .markAsAdvanced();

        this.platformExtension.addAction(
                "AjoutObjConcern",
                "Pick all instances",
                "Pick all instances of the specified object(s). When you pick all instances, "
                + "the next conditions and actions of this event work on all of them.",
                "Pick all instances of _PARAM1_",
                "Objects",
                "res/actions/add24.png",
                "res/actions/add.png")
                .addCodeOnlyParameter("objectsContext", this.stringUtil.EMPTY_STRING)
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        this.platformExtension.addAction(
                "AjoutHasard",
                "Pick a random object",
                "Pick one object from all the specified objects. When an object is picked, "
                + "the next conditions and actions of this event work only on that object.",
                "Pick a random _PARAM1_",
                "Objects",
                "res/actions/ajouthasard24.png",
                "res/actions/ajouthasard.png")
                .addCodeOnlyParameter("currentScene", this.stringUtil.EMPTY_STRING)
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .markAsSimple();

        this.platformExtension.addAction(
                "MoveObjects",
                "Apply movement to all objects",
                "Moves all objects according to the forces they have. GDevelop calls this action at the end of the events by default.",
                "Apply movement to all objects",
                "Movement using forces",
                "res/actions/doMove24.png",
                "res/actions/doMove.png")
                .addCodeOnlyParameter("currentScene", this.stringUtil.EMPTY_STRING)
                .markAsAdvanced();

        this.platformExtension.addCondition(
                "SeDirige",
                "An object is moving toward another (using forces)",
                "Check if an object moves toward another.\nThe first object must move.",
                "_PARAM0_ is moving toward _PARAM1_",
                "Movement using forces",
                "res/conditions/sedirige24.png",
                "res/conditions/sedirige.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_LIST, "Object 2", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Tolerance, in degrees", stringUtil.EMPTY_STRING, false)
                .addCodeOnlyParameter("conditionInverted", this.stringUtil.EMPTY_STRING)
                .markAsAdvanced();

        this.platformExtension.addCondition(
                "Distance",
                "Distance between two objects",
                "Compare the distance between two objects.\nIf condition is inverted, "
                + "only objects that have a distance greater than specified to any other object will be picked.",
                "_PARAM0_ distance to _PARAM1_ is below _PARAM2_ pixels",
                "Position",
                "res/conditions/distance24.png",
                "res/conditions/distance.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_LIST, "Object 2", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Distance", stringUtil.EMPTY_STRING, false)
                .addCodeOnlyParameter("conditionInverted", this.stringUtil.EMPTY_STRING)
                .markAsSimple();

        this.platformExtension.addCondition(
                "AjoutObjConcern",
                "Pick all objects",
                "Pick all the specified objects. When you pick all objects, the next conditions and actions of this event work on all of them.",
                "Pick all _PARAM1_ objects",
                "Objects",
                "res/conditions/add24.png",
                "res/conditions/add.png")
                .addCodeOnlyParameter("currentScene", this.stringUtil.EMPTY_STRING)
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .markAsAdvanced();

        this.platformExtension.addCondition(
                "AjoutHasard",
                "Pick a random object",
                "Pick one object from all the specified objects. When an object is picked, "
                + "the next conditions and actions of this event work only on that object.",
                "Pick a random _PARAM1_",
                "Objects",
                "res/conditions/ajouthasard24.png",
                "res/conditions/ajouthasard.png")
                .addCodeOnlyParameter("currentScene", this.stringUtil.EMPTY_STRING)
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .markAsSimple();

        this.platformExtension.addCondition(
                "PickNearest",
                "Pick nearest object",
                "Pick the object of this type that is nearest to the specified position. If the condition is inverted, "
                + "the object farthest from the specified position is picked instead.",
                "Pick the _PARAM0_ that is nearest to _PARAM1_;_PARAM2_",
                "Objects",
                "res/conditions/distance24.png",
                "res/conditions/distance.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Y position", stringUtil.EMPTY_STRING, false)
                .addCodeOnlyParameter("conditionInverted", this.stringUtil.EMPTY_STRING)
                .markAsSimple();

        this.platformExtension.addCondition(
                "NbObjet",
                "Number of objects",
                "Count how many of the specified objects are currently picked, and compare that number to a value. "
                + "If previous conditions on the objects have not been used, "
                + "this condition counts how many of these objects exist in the current scene.",
                "the number of _PARAM0_ objects",
                "Objects",
                "res/conditions/nbObjet24.png",
                "res/conditions/nbObjet.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .useStandardRelationalOperatorParameters(this.parameterFactory.NUMBER)
                .markAsSimple();

        this.platformExtension
                .addCondition(
                        "CollisionNP", //"CollisionNP" cames from an old condition to test
                        // collision between two sprites non precisely.
                        "Collision",
                        "Test the collision between two objects using their collision masks.\nNote that some objects may not have collision masks.\n"
                        + "Some others, like Sprite objects, also provide more precise collision conditions.",
                        "_PARAM0_ is in collision with _PARAM1_",
                        "Collision",
                        "res/conditions/collision24.png",
                        "res/conditions/collision.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false)
                .addCodeOnlyParameter("conditionInverted", this.stringUtil.EMPTY_STRING)
                .addCodeOnlyParameter("currentScene", this.stringUtil.EMPTY_STRING)
                .addParameter(this.parameterFactory.YES_OR_NO,
                        "Ignore objects that are touching each other on their edges, but are not overlapping (default: no)", this.stringUtil.EMPTY_STRING, true)
                .setDefaultValue("no")
                .markAsSimple();

        this.platformExtension.addCondition(
                "EstTourne",
                "An object is turned toward another",
                "Check if an object is turned toward another",
                "_PARAM0_ is rotated towards _PARAM1_",
                "Angle",
                "res/conditions/estTourne24.png",
                "res/conditions/estTourne.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, "Name of the object", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.OBJECT_LIST, "Name of the second object", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION,
                        "Angle of tolerance, in degrees (0: minimum tolerance)", stringUtil.EMPTY_STRING, false)
                .addCodeOnlyParameter("conditionInverted", this.stringUtil.EMPTY_STRING)
                .markAsAdvanced();

        this.platformExtension.addCondition(
                "Raycast",
                "Raycast",
                "Sends a ray from the given source position and angle, intersecting the closest object.\nThe instersected object will become the only one taken into account.\nIf the condition is inverted, the object to be intersected will be the farthest one within the ray radius.",
                "Cast a ray from _PARAM1_;_PARAM2_, angle: _PARAM3_ and max distance: _PARAM4_px, against _PARAM0_, and save the result in _PARAM5_, _PARAM6_",
                "Collision",
                "res/conditions/raycast24.png",
                "res/conditions/raycast.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, "Objects to test against the ray", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Ray source X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Ray source Y position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Ray angle (in degrees)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Ray maximum distance (in pixels)", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.SCENE_VAR, "Result X position scene variable", stringUtil.EMPTY_STRING, false)
                .setParameterLongDescription(
                        "Scene variable where to store the X position of the intersection. If no intersection is found, the variable won't be changed.")
                .addParameter(this.parameterFactory.SCENE_VAR, "Result Y position scene variable", stringUtil.EMPTY_STRING, false)
                .setParameterLongDescription(
                        "Scene variable where to store the Y position of the intersection. If no intersection is found, the variable won't be changed.")
                .addCodeOnlyParameter("conditionInverted", this.stringUtil.EMPTY_STRING)
                .markAsAdvanced();

        this.platformExtension.addCondition(
                "RaycastToPosition",
                "Raycast to position",
                "Sends a ray from the given source position to the final point, intersecting the closest object.\n"
                + "The instersected object will become the only one taken into account.\n"
                + "If the condition is inverted, the object to be intersected will be the farthest one within the ray radius.",
                "Cast a ray from from _PARAM1_;_PARAM2_ to _PARAM3_;_PARAM4_ against _PARAM0_, and save the result in _PARAM5_, _PARAM6_",
                "Collision",
                "res/conditions/raycast24.png",
                "res/conditions/raycast.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, "Objects to test against the ray", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Ray source X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Ray source Y position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Ray target X position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.EXPRESSION, "Ray target Y position", stringUtil.EMPTY_STRING, false)
                .addParameter(this.parameterFactory.SCENE_VAR, "Result X position scene variable", stringUtil.EMPTY_STRING, false)
                .setParameterLongDescription(
                        "Scene variable where to store the X position of the intersection. If no intersection is found, the variable won't be changed.")
                .addParameter(this.parameterFactory.SCENE_VAR, "Result Y position scene variable", stringUtil.EMPTY_STRING, false)
                .setParameterLongDescription(
                        "Scene variable where to store the Y position of the intersection. If no intersection is found, the variable won't be changed.")
                .addCodeOnlyParameter("conditionInverted", this.stringUtil.EMPTY_STRING)
                .markAsAdvanced();

        this.platformExtension
                .addExpression("Count",
                        "Number of objects",
                        "Count the number of the specified objects being currently picked in the event",
                        "Objects",
                        "res/conditions/nbObjet.png")
                .addParameter(this.parameterFactory.OBJECT_LIST, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addStrExpression("ObjectName",
                "Object name",
                "Return the name of the object",
                "Objects",
                "res/conditions/text.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

        behaviorMetadata.addStrExpression("Layer",
                "Object layer",
                "Return the name of the layer the object is on",
                "Objects",
                "res/actions/layer.png")
                .addParameter(this.parameterFactory.OBJECT, OBJECT, stringUtil.EMPTY_STRING, false);

    }
}
