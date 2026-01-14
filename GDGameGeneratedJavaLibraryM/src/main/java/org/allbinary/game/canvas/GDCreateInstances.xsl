<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    
    <xsl:template name="createInstances" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="exclusionObjectsAsString" />

        <xsl:call-template name="globalCentreCameraActions" >
            <xsl:with-param name="baseLayer" >true</xsl:with-param>
        </xsl:call-template>
                    
        <xsl:call-template name="globalZoomCameraActions" >
            <xsl:with-param name="baseLayer" >true</xsl:with-param>
        </xsl:call-template>
                
        <xsl:variable name="hasCentreCamera" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
        
                    //instances create - START
                    <xsl:for-each select="instances" >
                        <xsl:variable name="nodeIdAsString" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                        <xsl:variable name="name" select="name" />
                        <xsl:variable name="colonName" >:<xsl:value-of select="name" /></xsl:variable>

                        //name=<xsl:value-of select="name" /> layer=<xsl:value-of select="layer" />
                                                
                        <xsl:if test="contains($exclusionObjectsAsString, $colonName)" >
                            //Skipping instance name=<xsl:value-of select="name" /> exclusionType=<xsl:value-of select="$exclusionObjectsAsString" />
                        </xsl:if>
                        <xsl:if test="not(contains($exclusionObjectsAsString, $colonName))" >
                            
                        <xsl:text>&#10;</xsl:text>
                        if(true) {
                            //logUtil.put("<xsl:value-of select="$name" />", this, commonStrings.CONSTRUCTOR);
                            <xsl:if test="contains(name, 'btn_')" >
                        //btn_ - found
                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                        //final int width = (int) (touchImageResources.<xsl:value-of select="name" />Width(0) / 1.44f);
                        //final int height = (int) (touchImageResources.<xsl:value-of select="name" />Height(0) / 1.44f);
                        <xsl:if test="contains(name, 'joystick_')" >final float joystickScale = (org.allbinary.AndroidUtil.isAndroid() ? 0.75f : 1.0f);</xsl:if>
                        final int width = (int) (touchImageResources.<xsl:value-of select="name" />Width(0) * scaleTouchButtons<xsl:if test="contains(name, 'joystick_')" > * joystickScale</xsl:if>);
                        final int height = (int) (touchImageResources.<xsl:value-of select="name" />Height(0) * scaleTouchButtons<xsl:if test="contains(name, 'joystick_')" > * joystickScale</xsl:if>);
                                </xsl:if>
                                <xsl:if test="height != 0 and width != 0" >
                        //final int width = (int) (<xsl:value-of select="width" /> * 1.44f);
                        //final int height = (int) (<xsl:value-of select="height" /> * 1.44f);
                        final int width = (int) (<xsl:value-of select="width" /> * scaleTouchButtons);
                        final int height = (int) (<xsl:value-of select="height" /> * scaleTouchButtons);
                                </xsl:if>
                        final float customScale = scaleTouchButtons;
                            </xsl:if>                            
                            <xsl:if test="not(contains(name, 'btn_'))" >
                        //btn_ - not
                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                        //final int width = (int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />Rectangle.getWidth() / 1.44f);
                        //final int height = (int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />Rectangle.getHeight() / 1.44f);
                        final int width = (int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />Rectangle.getWidth());
                        final int height = (int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />Rectangle.getHeight());
                                </xsl:if>
                                <xsl:if test="height != 0 and width != 0" >
                        //final int width = (int) (<xsl:value-of select="width" /> * 1.44f);
                        //final int height = (int) (<xsl:value-of select="height" /> * 1.44f);
                        final int width = (int) (<xsl:value-of select="width" />);
                        final int height = (int) (<xsl:value-of select="height" />);
                                </xsl:if>
                        final float customScale = 1.0f;

                            </xsl:if>
                            
                        <xsl:if test="contains($hasCentreCamera, 'found')" >
                        final int <xsl:value-of select="name" />X = centerCameraX != 0 ? centerCameraX - width / 2 : (int) (<xsl:value-of select="x" /> * baseLayerScale);
                        final int <xsl:value-of select="name" />Y =
                            <xsl:if test="contains(name, 'btn_')" >
                                //btn_ - Hack - for android orientation change.
                                 (int) <xsl:if test="y = 506" >gameTickDisplayInfoSingleton.getLastHeight() - (touchImageResources.<xsl:value-of select="name" />Height(0) + (touchImageResources.<xsl:value-of select="name" />Height(0) / 100));</xsl:if>
                                <xsl:if test="y = 415" >gameTickDisplayInfoSingleton.getLastHeight() - (2 * (touchImageResources.<xsl:value-of select="name" />Height(0) + (touchImageResources.<xsl:value-of select="name" />Height(0) / 100)));</xsl:if>
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'btn_'))" >
                                //btn_ - not 2
                                centerCameraX != 0 ? centerCameraY - height / 2 :  (int) (<xsl:value-of select="y" /> * baseLayerScale);
                            </xsl:if>
                        </xsl:if>

                        <xsl:if test="not(contains($hasCentreCamera, 'found'))" >
                        final int <xsl:value-of select="name" />X = (int) (<xsl:value-of select="x" /> * baseLayerScale);
                        final int <xsl:value-of select="name" />Y = (int) (<xsl:value-of select="y" /> * baseLayerScale);
                        </xsl:if>

                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.objectArray == nullUtil.NULL_OBJECT_ARRAY) {
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.ensureCapacity(1);
                        }

                        //LayoutBuilder
                        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>
                        final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="name" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:call-template name="objectFactoryFromProperty" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectFactory.get(
                        width, height,
                        <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME);

                        <xsl:value-of select="name" />.set(null, <xsl:value-of select="name" />X, 
                        <xsl:value-of select="name" />Y, 
                    //zOrder - <xsl:value-of select="zOrder" />
                    //layer=<xsl:value-of select="layer" /> (Base Layer is emtpy)
                            <xsl:if test="contains(layer, 'Below')" >
                    //Below - zOrder
                    <xsl:value-of select="zOrder" />
                            </xsl:if>
                            <xsl:if test="contains(layer, 'touch')" >
                    //touch - zOrder
                    <xsl:value-of select="zOrder" />
                            </xsl:if>
                            <xsl:if test="not(layer) or string-length(layer) = 0 or contains(layer, 'Base Layer')" >
                    //Base Layer - zOrder + 200
                    <xsl:value-of select="zOrder + 200" />
                            </xsl:if>
                            <xsl:if test="contains(layer, 'Above')" >
                    //Above - zOrder + 400
                    <xsl:value-of select="zOrder + 400" />
                            </xsl:if>
                            <xsl:if test="contains(layer, 'Overlay') or contains(layer, 'UI') or contains(text(), 'gui')" >
                    //Overlay - zOrder + 600
                    <xsl:value-of select="zOrder + 600" />
                            </xsl:if>
                            <xsl:if test="contains(layer, 'Top')" >
                    //Top - zOrder + 800
                    <xsl:value-of select="zOrder + 800" />
                            </xsl:if>);
                                                
                        <xsl:value-of select="name" />.customScale = customScale;

                        final int index = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size();

                        final StringMaker stringBuilder = new StringMaker();
                        //stringBuilder.delete(0, stringBuilder.length());
                                                
                        //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDObjectList.add(<xsl:value-of select="name" />);

                            <xsl:if test="initialVariables" >
                            <xsl:value-of select="$name" />.initialVariables = new GDInitialVariables() {
                                public void reset() {
                            <xsl:for-each select="initialVariables" >//initialVariables - //<xsl:value-of select="type" /> - //<xsl:value-of select="name" /> - //<xsl:value-of select="value" />
                            <xsl:text>&#10;</xsl:text>
<xsl:text>                  </xsl:text><xsl:value-of select="$name" />.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            <xsl:text>&#10;</xsl:text>
                            </xsl:for-each>
                                }
                            };
                            <xsl:value-of select="$name" />.initialVariables.reset();
                            </xsl:if>

                        <xsl:if test="contains(name, 'btn_')" >
                        //btn_ - //Rectangle
                        //Touch Rectangle
                        //final Rectangle <xsl:value-of select="name" />Rectangle = new Rectangle(
                        //    pointFactory.getInstance(<xsl:value-of select="name" />.x, <xsl:value-of select="name" />.y),
                        //    (int) (<xsl:value-of select="name" />.Width(globals.graphics) * scaleTouchButtons), (int) (<xsl:value-of select="name" />.Height(globals.graphics) * scaleTouchButtons));
                        //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />RectangleList.add(<xsl:value-of select="name" />Rectangle);
                        </xsl:if>
                                                
                        //Create - Instances - START
                        final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                        final AllBinaryGameLayerManager allBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager;
                        
                        final GDGameLayer <xsl:value-of select="name" />GDGameLayer = <xsl:call-template name="globalResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerFactory.create(<xsl:value-of select="$layoutIndex" />, stringBuilder.append(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME).append(CommonSeps.getInstance().UNDERSCORE).append(index).toString(), <xsl:value-of select="name" />, 
                        scale, scale,     
                        null); //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDConditionWithGroupActions);
                        <xsl:value-of select="name" />GDGameLayer.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
                        logUtil.put("<xsl:value-of select="$nodeIdAsString" /> for <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer); at: 0", this, commonStrings.PROCESS);
                        <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer);
                        globals.<xsl:value-of select="name" />GDInstanceGDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer);

                        //updateGDObject - 7
                        <xsl:value-of select="name" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                        
                        <xsl:variable name="gameLayer" ><xsl:value-of select="name" />GDGameLayer</xsl:variable>
                        //logUtil.put("<xsl:value-of select="$gameLayer" />.gdObject.zOrder" + <xsl:value-of select="$gameLayer" />.gdObject.zOrder, this, commonStrings.PROCESS);
                        //logUtil.put("<xsl:value-of select="$gameLayer" />.getZ()" + <xsl:value-of select="$gameLayer" />.getZ(), this, commonStrings.PROCESS);
                        allBinaryGameLayerManager.insert(<xsl:value-of select="name" />GDGameLayer);
                        //Create - Instances - END
                        
                        <xsl:for-each select=".." >
                            <xsl:call-template name="globalUpdateCentreCameraActions" >
                                <xsl:with-param name="baseLayer" >true</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        }
                        </xsl:if>
                    </xsl:for-each>
                    //instances create - END
    </xsl:template>

</xsl:stylesheet>
