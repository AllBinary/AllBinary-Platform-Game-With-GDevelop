<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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

package org.allbinary.graphics.threed.min3d;

import min3d.vos.Camera;

import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.logic.string.StringMaker;

public class GD<GD_CURRENT_INDEX>GameCameraSetup extends GDGameCameraSetup
{
    private static final GD<GD_CURRENT_INDEX>GameCameraSetup instance = new GD<GD_CURRENT_INDEX>GameCameraSetup();

    /**
     * @return the instance
     */
    public static GD<GD_CURRENT_INDEX>GameCameraSetup getInstance() {
        return instance;
    }

    private GD<GD_CURRENT_INDEX>GameCameraSetup()
    {
    }

        <xsl:for-each select="properties" >
    public void process(final Camera camera, final StringMaker stringMaker) {
            
            final GameTickDisplayInfoSingleton displayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
            
            <xsl:for-each select="camera" >
            //x is height, y is distance from game area, z is width            
            //if(CameraMotionGestureInputProcessor.getInstance().restore(scene, stringMaker)) {

            //} else 
            if(displayInfoSingleton.isPortrait()) {
            
                stringMaker.append("portrait: ");

                //MyCanvas aLastWidth: 385 aLastHeight: 639 Display Info: fullWidth: 1440 fullHeight: 2392 lastWidth: 385 lastHeight: 639 lastHalfWidth: 192 lastHalfHeight: 319
                //319.0, 900.0, -639.0->319.0, 0.0, -629.0
                //319.0, 815.0, -779.0->319.0, -625.0, -629.0
                
                //MyCanvas aLastWidth: 470 aLastHeight: 640 Display Info: fullWidth: 1800 fullHeight: 2448 lastWidth: 470 lastHeight: 640 lastHalfWidth: 235 lastHalfHeight: 320
                //195.0, 740.0, -835.0->205.0, -785.0, -765.0

            <xsl:for-each select="portrait" >
                <xsl:for-each select="position" >
                camera.position.x = <xsl:value-of select="x" />;
                camera.position.y = <xsl:value-of select="y" />;
                camera.position.z = <xsl:value-of select="z" />;
                </xsl:for-each>

                <xsl:for-each select="target" >
                camera.target.getPosition().x = <xsl:value-of select="x" />;
                camera.target.getPosition().y = <xsl:value-of select="y" />;
                camera.target.getPosition().z = <xsl:value-of select="z" />;
                </xsl:for-each>
            </xsl:for-each>

                //camera.position.x = displayInfoSingleton.getLastHalfHeight() - 125;
                //camera.position.y = (displayInfoSingleton.getLastHeight() + 100);
                //camera.position.z = -(displayInfoSingleton.getLastHeight()) - 200;

                //camera.target.getPosition().x = displayInfoSingleton.getLastHalfHeight() - 125;
                //camera.target.getPosition().y = -(displayInfoSingleton.getLastHeight() + 100);
                //camera.target.getPosition().z = -(displayInfoSingleton.getLastHeight()) - 100;

            } else {
                stringMaker.append("landscape: ");
                
                //MyCanvas aLastWidth: 640 aLastHeight: 422 Display Info: fullWidth: 2560 fullHeight: 1688 lastWidth: 640 lastHeight: 422 lastHalfWidth: 320 lastHalfHeight: 211
                //-84.0, 640.0, -650.0->-54.0, -1980.0, 70.0
                
            <xsl:for-each select="landscape" >
                <xsl:for-each select="position" >
                camera.position.x = <xsl:value-of select="x" />;
                camera.position.y = <xsl:value-of select="y" />;
                camera.position.z = <xsl:value-of select="z" />;
                </xsl:for-each>

                <xsl:for-each select="target" >
                camera.target.getPosition().x = <xsl:value-of select="x" />;
                camera.target.getPosition().y = <xsl:value-of select="y" />;
                camera.target.getPosition().z = <xsl:value-of select="z" />;
                </xsl:for-each>
            </xsl:for-each>
                
                //camera.position.x = -84; //displayInfoSingleton.getLastHalfHeight();
                //camera.position.y = displayInfoSingleton.getLastWidth();
                //camera.position.z = -((displayInfoSingleton.getLastWidth()) + 10);

                //camera.target.getPosition().x = -54; //displayInfoSingleton.getLastHalfHeight();
                //camera.target.getPosition().y = -(displayInfoSingleton.getLastWidth() + 1360);
                //camera.target.getPosition().z = 70;

            }
            </xsl:for-each>
    }
        </xsl:for-each>               
}
    </xsl:template>

</xsl:stylesheet>
