/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 * 
 */
package org.allbinary.gdevelop.loader.utils;

import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class GDMakeScene3dModel3dObject {
        
    public static void main(String[] args) throws Exception {

        final String RESOURCE_0 = ",\n" +
"        {\n" +
"          \"assetStoreId\": \"\",\n" +
"          \"name\": \"";

        final String RESOURCE_2 = "\",\n" +
"          \"type\": \"Scene3D::Model3DObject\",\n" +
//"          \"variables\": [],\n" +
"          \"variables\": [\n" +
"            {\n" +
"              \"name\": \"lane\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 0\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"currentZRotation\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 0\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"health\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 100\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"lives\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 1\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"opacity\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 255\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"type\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 0\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"lastFireTime\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 0\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"pathing\",\n" +
"              \"type\": \"boolean\",\n" +
"              \"value\": false\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"lastPathingTime\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 0\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"channel\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": -1\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"attackBehavior\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 0\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"physicsOffsetZ\",\n" +
"              \"type\": \"number\",\n" +
"              \"value\": 0.42\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"inLineOfSight\",\n" +
"              \"type\": \"boolean\",\n" +
"              \"value\": false\n" +
"            }\n" +
"          ],\n" +
"          \"effects\": [],\n" +
//"          \"behaviors\": [],\n" +
"          \"behaviors\": [\n" +
"            {\n" +
"              \"name\": \"Material3D\",\n" +
"              \"type\": \"Material3D::Material3D\"\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"Pathfinding\",\n" +
"              \"type\": \"PathfindingBehavior::PathfindingBehavior\",\n" +
"              \"extraBorder\": 10,\n" +
"              \"angularMaxSpeed\": 180,\n" +
"              \"rotateObject\": true,\n" +
"              \"angleOffset\": 0,\n" +
"              \"cellHeight\": 20,\n" +
"              \"maxSpeed\": 180,\n" +
"              \"gridOffsetY\": 0,\n" +
"              \"cellWidth\": 20,\n" +
"              \"acceleration\": 180,\n" +
"              \"allowDiagonals\": true,\n" +
"              \"gridOffsetX\": 0,\n" +
"              \"smoothingMaxCellGap\": 1\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"Physics3D\",\n" +
"              \"type\": \"Physics3D::Physics3DBehavior\",\n" +
"              \"bodyType\": \"Dynamic\",\n" +
"              \"gravityScale\": 1,\n" +
"              \"object3D\": \"Object3D\",\n" +
"              \"meshShapeResourceName\": \"\",\n" +
"              \"massCenterOffsetZ\": 0,\n" +
"              \"massCenterOffsetY\": 0,\n" +
"              \"shapeOrientation\": \"Z\",\n" +
"              \"massCenterOffsetX\": 0,\n" +
"              \"massOverride\": 0,\n" +
"              \"layers\": 17,\n" +
"              \"shapeDimensionC\": 0,\n" +
"              \"shapeDimensionB\": 0,\n" +
"              \"shapeDimensionA\": 0,\n" +
"              \"bullet\": false,\n" +
"              \"shape\": \"Box\",\n" +
"              \"density\": 1,\n" +
"              \"linearDamping\": 0.1,\n" +
"              \"angularDamping\": 0.1,\n" +
"              \"masks\": 17,\n" +
"              \"friction\": 0.3,\n" +
"              \"restitution\": 0.1,\n" +
"              \"shapeOffsetZ\": 0,\n" +
"              \"shapeOffsetX\": 0,\n" +
"              \"shapeOffsetY\": 0,\n" +
"              \"fixedRotation\": false\n" +
"            },\n" +
"            {\n" +
"              \"name\": \"PhysicsCharacter3D\",\n" +
"              \"type\": \"Physics3D::PhysicsCharacter3D\",\n" +
"              \"fallingSpeedMax\": 700,\n" +
"              \"forwardDeceleration\": 1200,\n" +
"              \"sidewaysSpeedMax\": 400,\n" +
"              \"slopeMaxAngle\": 50,\n" +
"              \"physics3D\": \"Physics3D\",\n" +
"              \"sidewaysDeceleration\": 800,\n" +
"              \"forwardAcceleration\": 1200,\n" +
"              \"forwardSpeedMax\": 600,\n" +
"              \"sidewaysAcceleration\": 800,\n" +
"              \"jumpHeight\": 200,\n" +
"              \"shouldBindObjectAndForwardAngle\": true,\n" +
"              \"canBePushed\": true,\n" +
"              \"gravity\": 1000,\n" +
"              \"jumpSustainTime\": 0.2,\n" +
"              \"stairHeightMax\": 20\n" +
"            }\n" +
"          ],\n" +
"          \"content\": {\n" +
"            \"centerLocation\": \"ModelOrigin\",\n" +
"            \"crossfadeDuration\": 0.10000000149011612,\n" +
"            \"depth\": 76.89114452412127,\n" +
"            \"height\": 86.58825796137215,\n" +
"            \"isCastingShadow\": true,\n" +
"            \"isReceivingShadow\": false,\n" +
"            \"keepAspectRatio\": true,\n" +
"            \"materialType\": \"StandardWithoutMetalness\",\n" +
"            \"modelResourceName\": \"";

        final String RESOURCE_4 = ".glb\",\n" +
"            \"originLocation\": \"ModelOrigin\",\n" +
"            \"rotationX\": 90,\n" +
"            \"rotationY\": 0,\n" +
"            \"rotationZ\": 90,\n" +
"            \"width\": 74.02601269532515,\n" +
//"            \"animations\": []\n" +
"            \"originLocation\": \"ModelOrigin\",\n" +
"            \"rotationX\": 90,\n" +
"            \"rotationY\": 0,\n" +
"            \"rotationZ\": 90,\n" +
"            \"width\": 16.655036287247224,\n" +
"            \"animations\": [\n" +
"              {\n" +
"                \"loop\": true,\n" +
"                \"name\": \"Walk\",\n" +
"                \"source\": \"Walk\"\n" +
"              },\n" +
"              {\n" +
"                \"loop\": true,\n" +
"                \"name\": \"Attack\",\n" +
"                \"source\": \"Attack\"\n" +
"              },\n" +
"              {\n" +
"                \"loop\": false,\n" +
"                \"name\": \"Defeat\",\n" +
"                \"source\": \"Defeat\"\n" +
"              },\n" +
"              {\n" +
"                \"loop\": true,\n" +
"                \"name\": \"Idle\",\n" +
"                \"source\": \"Idle\"\n" +
"              }\n" +
"            ]\n" +
"          }\n" +
"        }";
        
        final GLBVisitor glbVisitor = new GLBVisitor() {

            public void append(final String fileNameAsString, final String name, final StringMaker stringMaker) {
                stringMaker.append(RESOURCE_0);
                stringMaker.append(name);
                stringMaker.append(RESOURCE_2);
                stringMaker.append(name);
                stringMaker.append(RESOURCE_4);
            }

        };
        
        new GLBProcessing().process(glbVisitor);

    }
    
    
}
