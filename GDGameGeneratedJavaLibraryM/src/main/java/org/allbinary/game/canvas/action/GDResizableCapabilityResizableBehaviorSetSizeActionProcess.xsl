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

    <xsl:template name="resizableCapabilityResizableBehaviorSetSizeActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                                <xsl:variable name="paramOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramFour" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /><xsl:if test="number(text()) = text()" >f</xsl:if></xsl:if></xsl:for-each></xsl:variable>
        
                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $paramOne" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        
                            <xsl:variable name="hasObjectGroup" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $paramOne" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>
        
                        //ResizableCapability::ResizableBehavior::SetSize - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {

                                //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                
                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            final int size4 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerListOfList.size();
                            for(int index4 = 0; index4 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size4; index4++) {
                            final BasicArrayList <xsl:value-of select="$paramOne" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerListOfList.get(index4));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            final BasicArrayList <xsl:value-of select="$paramOne" />GDGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerList;
                            </xsl:if>
                                
                                final int size = <xsl:value-of select="$paramOne" />GDGameLayerList.size();
                                GDGameLayer <xsl:value-of select="$paramOne" />GDGameLayer;
                                GDObject <xsl:value-of select="$paramOne" />;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    <xsl:value-of select="$paramOne" />GDGameLayer = (GDGameLayer) <xsl:value-of select="$paramOne" />GDGameLayerList.get(index);
                                    <xsl:value-of select="$paramOne" /> = <xsl:value-of select="$paramOne" />GDGameLayer.gdObject;
                                    if(<xsl:value-of select="$paramOne" />.scaleY == 1.0f) {
                                        <xsl:value-of select="$paramOne" />.widthAtInitialScale = <xsl:value-of select="$paramOne" />.width;
                                        <xsl:value-of select="$paramOne" />.heightAtInitialScale = <xsl:value-of select="$paramOne" />.height;
                                    }
                                    <xsl:value-of select="$paramOne" />.scaleX = (<xsl:value-of select="$paramFour" />) / <xsl:value-of select="$paramOne" />.widthAtInitialScale;
                                    <xsl:value-of select="$paramOne" />.scaleY = (<xsl:value-of select="$paramFour" />) / <xsl:value-of select="$paramOne" />.heightAtInitialScale;
                                    <xsl:value-of select="$paramOne" />GDGameLayer.setScalable();
                                    <xsl:value-of select="$paramOne" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                                }

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            }
                            </xsl:if>
                                    
                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
                        }

                        @Override
                        public boolean process(final int index) throws Exception {
                            super.processStats();

                            try {

                                //logUtil.putF(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS);

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            final int size4 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerListOfList.size();
                            for(int index4 = 0; index4 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size4; index4++) {
                            final BasicArrayList <xsl:value-of select="$paramOne" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerListOfList.get(index4));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            final BasicArrayList <xsl:value-of select="$paramOne" />GDGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerList;
                            </xsl:if>
                                
                                final GDGameLayer <xsl:value-of select="$paramOne" />GDGameLayer = (GDGameLayer) <xsl:value-of select="$paramOne" />GDGameLayerList.get(index);
                                <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramOne" /></xsl:variable>
                                final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$paramOne" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$paramOne" />GDGameLayer.gdObject;
                                if(<xsl:value-of select="$paramOne" />.scaleY == 1.0f) {
                                    <xsl:value-of select="$paramOne" />.widthAtInitialScale = <xsl:value-of select="$paramOne" />.width;
                                    <xsl:value-of select="$paramOne" />.heightAtInitialScale = <xsl:value-of select="$paramOne" />.height;
                                }
                                <xsl:value-of select="$paramOne" />.scaleX = (<xsl:value-of select="$paramFour" />) / <xsl:value-of select="$paramOne" />.widthAtInitialScale;
                                <xsl:value-of select="$paramOne" />.scaleY = (<xsl:value-of select="$paramFour" />) / <xsl:value-of select="$paramOne" />.heightAtInitialScale;
                                <xsl:value-of select="$paramOne" />GDGameLayer.setScalable();
                                <xsl:value-of select="$paramOne" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            }
                            </xsl:if>

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
                        }

                    @Override
                    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                        super.processStats(motionGestureEvent);
                        
                        //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                        
                        return this.process();
                    }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2) throws Exception {
                            super.processGDStats(gameLayer);

                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                            this.process();
                    
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

</xsl:stylesheet>
