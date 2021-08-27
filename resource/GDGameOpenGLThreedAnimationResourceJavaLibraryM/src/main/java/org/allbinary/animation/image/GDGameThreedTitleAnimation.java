/*
 *Copyright (c) 2002 All Binary
 *All Rights Reserved.
 *Don't Duplicate or Distributed.
 *Trade Secret Information
 *For Internal Use Only
 *Confidential
 *Unpublished
 *
 *Created By: Travis Berthelot
 *Date: 11/29/02
 *
 *
 *Modified By         When       ?
 *
 */
package org.allbinary.animation.image;

import javax.microedition.lcdui.Graphics;

import org.allbinary.animation.ThreedAnimation;
import org.allbinary.game.layer.CameraLayer;
import org.allbinary.game.gd.GDGameAllBinarySceneControllerFactory;
import org.allbinary.graphics.threed.min3d.GDGameSceneController;

import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.special.TitleAnimation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.ColorChangeEvent;
import org.allbinary.graphics.color.ColorChangeListener;
import org.allbinary.logic.basic.util.event.AllBinaryEventObject;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.graphics.geography.map.ColorFromEventUtil;
import org.allbinary.view.CenterViewPositionFactory;
import org.allbinary.view.ViewPosition;

public class GDGameThreedTitleAnimation
extends TitleAnimation 
implements ColorChangeListener
{
    private int color = ColorFromEventUtil.getInstance().COLOR_INT;
    
    //private final CameraLayer cameraLayer;
    private final GDGameSceneController testGameDemoSceneController;
    
    public GDGameThreedTitleAnimation(
            IndexedAnimation[] animationInterfaceArray, 
            BasicColor[] basicColorArray, 
            int[] dxArray, int[] dyArray, int y, int width) 
    throws Exception
    {
        super(animationInterfaceArray, basicColorArray, dxArray, dyArray, y, width);
        
        LogUtil.put(LogFactory.getInstance("Constructor", this, this.getClass().getName()));
        
        testGameDemoSceneController = (GDGameSceneController) 
            GDGameAllBinarySceneControllerFactory.getInstance();
    }
    
    public void onEvent(AllBinaryEventObject eventObject)
    {
        BasicColor basicColor = ((ColorChangeEvent) eventObject).getBasicColor(); 
        //LogUtil.put(LogFactory.getInstance("Color Change Event: " + basicColor.getName(), this, "onEvent"));
        this.color = basicColor.intValue();
    }
    
    public void paint(Graphics graphics, int ax, int ay)
    {
        graphics.setColor(color);
        
        int x = 0;
        
        if(this.width != Integer.MIN_VALUE)
        {
            x = ((graphics.getClipWidth() - this.width) / 2);
        }
        
        int deltaX;
        int deltaY;

        for (int index = 0; index < size - 1; index++)
        {
            deltaX = this.dxArray[index] + x;
            deltaY = this.dyArray[index] + y;
            
            if (this.basicColorArray[index] != CLEAR_COLOR)
            {
                this.basicColorUtil.setBasicColor(graphics, this.basicColorArray[index]);
            }
            //LogUtil.put(LogFactory.getInstance("deltaX: " + deltaX + " " + x, this, "paint"));
            this.animationInterfaceArray[index].paint(graphics, deltaX, deltaY);
        }
    }
    
    private final ViewPosition viewPosition = new CenterViewPositionFactory().getInstance(0);
    
    public void paintThreed(Graphics graphics, int x, int y, int z)
    {
        /*
        int dx = 0;
        
        if(this.width != Integer.MIN_VALUE)
        {
            dx = ((graphics.getClipWidth() - this.width) / 2);
        }
        */
        
        //int deltaX;
        int deltaY;

        int index = size - 1;

        //CameraLayer cameraLayer = testGameDemoSceneController.getCameraLayer();
        
        //if(cameraLayer != null)
        //{
            int halfHeight = (graphics.getClipHeight() >> 3) / 3 * 2;
            
        //for (int index = 0; index < size; index++)
        //{
            //deltaX = this.dxArray[index] + dx;
            deltaY = this.dyArray[index] + y;

            //if (this.basicColorArray[index] != CLEAR_COLOR)
            //{
              //  this.basicColorUtil.setBasicColor(graphics, this.basicColorArray[index]);
            //}
            //LogUtil.put(LogFactory.getInstance("deltaX: " + deltaX + " " + x, this, "paint"));

            //this.animationInterfaceArray[index].paintThreed(graphics, deltaX, deltaY, 30);

            ThreedAnimation threedAnimation = (ThreedAnimation) this.animationInterfaceArray[index];

            threedAnimation.nextRotation();
            
            //PreLogUtil.put(Integer.toString(halfHeight), this, "***************");
            
            //deltaY = (deltaY >> 3) / 3 * 2 ;
            deltaY = (deltaY >> 2);

            int az = ((halfHeight - deltaY)); 
                    //* cameraLayer.getDistanceZ()) / 10000;
            
            //int ay = (viewPosition.getY() * cameraLayer.getDistanceZ()) / 700;
            
            //- deltaY
            //cameraLayer.getRotationY()
            //halfHeight / 2

            this.animationInterfaceArray[index].paintThreed(graphics, 
                    viewPosition.getX(), 
                    viewPosition.getY(),
                    //ay,
                    az);
        //}
        //}
    }
}
