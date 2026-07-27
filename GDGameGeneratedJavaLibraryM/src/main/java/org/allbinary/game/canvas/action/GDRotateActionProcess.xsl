<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="rotateActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>

        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="siblingOrParentOrList" ><xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList0" ><xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList0" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GDGameLayer </xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayer = </xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = </xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList2" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>if(</xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayerList</xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//if(<xsl:value-of select="$name" />GDGameLayerList</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList3" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GD</xsl:text>GlobalsGDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text> = (GDGlobalsGDObjectsFactory.</xsl:text><xsl:value-of select="$name" /><xsl:text></xsl:text>) <xsl:value-of select="$name" /><xsl:text></xsl:text>GDGameLayer.gdObject;</xsl:with-param><xsl:with-param name="replacementText" >//final GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" /> <xsl:value-of select="$name" /> = (GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrListOnlyListForTheMainParamIncludeList" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList4" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text> = (GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text></xsl:text>) <xsl:value-of select="$name" /><xsl:text></xsl:text>GDGameLayer.gdObject;</xsl:with-param><xsl:with-param name="replacementText" >//final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" />)<xsl:text> </xsl:text><xsl:value-of select="$name" />GDGameLayer.gdObject;</xsl:with-param></xsl:call-template></xsl:variable>

                        //Rotate - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {                            
                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                            final GDGameLayer[] gameLayerArray = gameGlobals.tempGameLayerArray;      
                            <xsl:value-of select="$siblingOrParentOrListOnlyListForTheMainParamIncludeList" />

                            GDGameLayer <xsl:value-of select="$name" />GDGameLayer;
                            <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size();
                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + size, this, commonStrings.PROCESS);

                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                <xsl:value-of select="$name" />GDGameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index);
                                <xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;

                                <xsl:call-template name="rotateActionProcessGDObject" >
                                </xsl:call-template>   
  
                                <xsl:value-of select="$name" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                            }
                            
                            <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template>

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
                        }

                        @Override
                        public void processReleased() throws Exception { //Rotate
                            super.processReleasedStats();
                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE);

                            if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.objectArray != nullUtil.NULL_OBJECT_ARRAY) {
                            GDGameLayer gameLayer;
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.get(index);

                                this.processReleased(((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.get(index)).gdObject);

                                //updateGDObject - 6
                                gameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                            }
                            } else {
                                //logUtil.putF("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was null", this, commonStrings.PROCESS);
                            }
                        }

                    @Override
                    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                        super.processStats(motionGestureEvent);
                        
                        //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                        
                        return this.process();
                    }
                                
                    @Override      
                    public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
                        super.processGDStats(gameLayerArray);
                        try {
                     
                        <xsl:value-of select="$siblingOrParentOrList" />
                        
                            boolean result = true;
                            <xsl:call-template name="rotateActionProcessGDObject" >
                            </xsl:call-template>

                            <xsl:value-of select="$name" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);

                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        } catch(Exception e) {
                            logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                        }

                        return true;
                    }

                        @Override
                        public boolean processReleased(final GDObject <xsl:value-of select="$name" />) {
                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                            <xsl:variable name="isAllowedToRelease" >
                                <xsl:for-each select="../conditions" >
                                    <xsl:if test="type/value = 'SourisSurObjet' or type/value = 'IsCursorOnObject' or type/value = 'KeyFromTextPressed'" >true</xsl:if>
                                </xsl:for-each>
                            </xsl:variable>

                            <xsl:if test="not(contains($isAllowedToRelease, 'true'))" >//</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.rotationP = 0;</xsl:if></xsl:for-each>
                            
                            return true;
                        }
                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        @Override
                        public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                            
                            //Map from object array with action params
                            final GDGameLayer gameLayer = (GDGameLayer) objectArray[1];
                            this.process(gameLayer, intArray[3], intArray[5]);

                            return true;
                        }
                        </xsl:if>

                        public void process(final GDGameLayer gameLayer, final int x, final int y) {
                            final GDObject gdObject = gameLayer.gdObject;
                            this.process(gdObject, x, y);
                        }

                        public void process(final GDObject gdObject, final int x, final int y) {
                            throw new RuntimeException();
                        }
    </xsl:template>

    <xsl:template name="rotateActionProcessGDObject" >

                                //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                //Parameters - 3
                                
                                <xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.rotationP = <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" > / 6;</xsl:if></xsl:for-each>
                                //<xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.angle += <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                                <xsl:text>&#10;</xsl:text>

                                //Haskish - it is hard to tell if this is a feature or a hack.
                                <xsl:if test="/game/properties/force2dCollision/text() = 'true'" >
                                <xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.rotationZP = <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" > / 6;</xsl:if></xsl:for-each>
                                <!-- new line -->
                                <xsl:text>&#10;</xsl:text>
                                </xsl:if>
                                
    </xsl:template>

</xsl:stylesheet>
