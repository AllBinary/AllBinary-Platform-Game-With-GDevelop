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

    <xsl:template name="mettreXYActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        
                        private final String ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "G: " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="parentConditionObject" >
                                <xsl:for-each select="../conditions" >
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:variable name="paramOne" ><xsl:value-of select="text()" /></xsl:variable>

                                            <xsl:for-each select="/game" >
                                                <xsl:for-each select="objects" >
                                                    <xsl:if test="$paramOne = name" >
                                                        <xsl:value-of select="name" />
                                                    </xsl:if>
                                                </xsl:for-each>

                                                <xsl:for-each select="layouts" >
                                                    <xsl:if test="$layoutIndex = position() -1" >
                                                        <xsl:for-each select="objects" >
                                                            <xsl:if test="$paramOne = name" >
                                                                <xsl:value-of select="name" />
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>

                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                        </xsl:variable>

                        <xsl:variable name="parentConditionWithoutObjects" >
                            <xsl:if test="string-length($parentConditionObject) = 0" >found</xsl:if>
                        </xsl:variable>

                            <xsl:variable name="parentObjectHasObjectGroup" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $parentConditionObject" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>

                        <xsl:variable name="actionAndParentConditionUseSameObject" >
                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="name2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:if test="$name = $name2" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        
                        <xsl:variable name="parametersAsString" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="not(contains($actionAndParentConditionUseSameObject, 'found')) and position() = 1" >
                                    <xsl:value-of select="text()" />.,
                                </xsl:if>                                    
                                <xsl:if test="position() != 1" >
                                    <xsl:value-of select="text()" />,
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        /*<xsl:for-each select="../conditions" ><xsl:value-of select="type" /><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:for-each>*/
                        //parentConditionObject=<xsl:value-of select="$parentConditionObject" />
                        //parentConditionWithoutObjects=<xsl:value-of select="$parentConditionWithoutObjects" /> - logic is not correct
                        /*parametersAsString=<xsl:value-of select="$parametersAsString" />*/

                        <xsl:variable name="isTextObject" ><xsl:for-each select="/game" ><xsl:for-each select="objects" ><xsl:if test="$name = name" ><xsl:if test="type = 'TextObject::Text'" >found</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="layouts" ><xsl:for-each select="objects" ><xsl:if test="$name = name" ><xsl:if test="type = 'TextObject::Text'" >found</xsl:if></xsl:if></xsl:for-each></xsl:for-each></xsl:for-each></xsl:variable>

                        //MettreXY
                        public boolean process() {

                            //boolean result = false;

                            <xsl:variable name="hasObjectGroup" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $name" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template><xsl:value-of select="$name" />GDObjectListOfList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            final BasicArrayList gdObjectList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template><xsl:value-of select="$name" />GDObjectListOfList.get(index));
                            final BasicArrayList gdGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template><xsl:value-of select="$name" />GDGameLayerListOfList.get(index));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            final BasicArrayList gdObjectList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template><xsl:value-of select="$name" />GDObjectList;
                            final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template><xsl:value-of select="$name" />GDGameLayerList;
                            </xsl:if>

                            final int size2 = gdObjectList.size();
                            //if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                            //    result = true;
                            //}

                            for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                            //if(gdObjectList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                final GDObject gdObject = (GDObject) gdObjectList.get(index2);
                                //result = result <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> 
                                this.processGI(gdObject, gdGameLayerList, index2, globals.graphics);
                            //}
                            }

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            }
                            </xsl:if>

                            //return result;
                            return true;
                        }

                        //@Override
                        public boolean processGI(final GDObject gdObject, final BasicArrayList gdGameLayerList, final int gdObjectIndex, final Graphics graphics) {

                            try {
                                super.processGStats(gdObject, graphics);
                        
                                final boolean result = this.processGPaintI(gdObject, graphics);
                                
                                <xsl:if test="contains($isTextObject, 'found')" >
                                    //TextObject::Text - does not currently have a GameLayer
                                    //if(gdGameLayerList != null gdGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    //}
                                </xsl:if>
                                <xsl:if test="not(contains($isTextObject, 'found'))" >
                                    final GDGameLayer gameLayer = (GDGameLayer) gdGameLayerList.get(gdObjectIndex);
                                    //final GDObject gdObject = gameLayer.gdObject;
                                    gameLayer.updatePosition();
                                </xsl:if>
                                
                                return result;

                            } catch(Exception e) {
                                //6
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        //@Override
                        public boolean processGSI(final GDGameLayer gameLayer, final Graphics graphics) {

                            try {
                                super.processGStats(gameLayer.gdObject, graphics);
                        
                                final boolean result = this.processGPaintI(gameLayer.gdObject, graphics);
                                
                                <xsl:if test="contains($isTextObject, 'found')" >
                                    //TextObject::Text - does not currently have a GameLayer
                                </xsl:if>
                                <xsl:if test="not(contains($isTextObject, 'found'))" >
                                    gameLayer.updatePosition();
                                </xsl:if>
                                
                                return result;

                            } catch(Exception e) {
                                //6
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        //@Override
                        public boolean processGPaintI(final GDObject gdObject, final Graphics graphics) {

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                //if(gdObject == null) {
                                //    LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "gdObject was null", this, commonStrings.PROCESS));
                                //    return;
                                //}
                            
                                //Param not from parent
                            <xsl:if test="not(contains($hasObjectGroup, 'found'))" >   
                                final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />) gdObject;
                            </xsl:if>
                            
                            <xsl:if test="contains($hasObjectGroup, 'found')" >
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                            </xsl:if>

                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS));

                    <xsl:for-each select="/game" >
                        <xsl:for-each select="objects" >
<!--                    //global name=<xsl:value-of select="name" />-->
                            <xsl:variable name="nameWithCall" ><xsl:value-of select="name" />.</xsl:variable>
                            <xsl:if test="not(name = $name)" >
                            <xsl:if test="contains($parametersAsString, $nameWithCall)" >
                    if(gameGlobals.<xsl:value-of select="name" />GDGameLayerList.size() == 0) {
                        return false;
                    }

                    final GDGameLayer <xsl:value-of select="name" />GDGameLayer = (GDGameLayer) gameGlobals.<xsl:value-of select="name" />GDGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer.gdObject;
                    final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" />)<xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" />GDGameLayer.gdObject;
                            </xsl:if>
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:for-each select="layouts" >
                            <xsl:if test="$layoutIndex = position() -1" >

                        <xsl:for-each select="objectsGroups" >
                            
                            <xsl:if test="not(name = $name)" >
                                //objectsGroups - <xsl:value-of select="name" />
<!--
                    final BasicArrayList gdGameLayerList = ((BasicArrayList) globals.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index));
                    if(gdGameLayerList.size() == 0) {
                        return false;
                    }

                    final GDGameLayer <xsl:value-of select="name" />GDGameLayer = (GDGameLayer) gdGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer.gdObject;
                    final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" />)<xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" />GDGameLayer.gdObject;
-->
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:for-each select="objects" >
                    //name=<xsl:value-of select="name" />
                            <xsl:variable name="nameWithCall" ><xsl:value-of select="name" />.</xsl:variable>
                            <xsl:if test="not(name = $name)" >
                            <xsl:if test="contains($parametersAsString, $nameWithCall)" >
                    if(globals.<xsl:value-of select="name" />GDGameLayerList.size() == 0) {
                        return false;
                    }

                    final GDGameLayer <xsl:value-of select="name" />GDGameLayer = (GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer.gdObject;
                    final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" />)<xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" />GDGameLayer.gdObject;
                            </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                            </xsl:if>
                       </xsl:for-each>
                    </xsl:for-each>
                                
                    <xsl:variable name="hasGameLayer2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), '.')" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="gameLayerName2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="gameLayerName3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName3=<xsl:value-of select="$gameLayerName3" />
                    <xsl:variable name="gameLayerName4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and contains(text(), '-')" ><xsl:value-of select="substring-after($gameLayerName3, '-')" /></xsl:if><xsl:if test="position() = 3 and not(contains($gameLayerName3, '-'))" ><xsl:value-of select="$gameLayerName3" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName4=<xsl:value-of select="$gameLayerName4" />
                    <xsl:variable name="gameLayerName" ><xsl:call-template name="substring-after-last" ><xsl:with-param name="string" ><xsl:value-of select="$gameLayerName4" /></xsl:with-param><xsl:with-param name="char" select="' '" /></xsl:call-template></xsl:variable>
                    //gameLayerName=<xsl:value-of select="$gameLayerName" />

                                <xsl:variable name="existingValueX" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x</xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="existingValueY" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y</xsl:if></xsl:for-each></xsl:variable>
                                
                        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable(')" >found</xsl:if></xsl:for-each></xsl:variable>

                        <xsl:if test="not(contains($hasObjectVariable, 'found'))" >
                                                                        
                            //hasObjectVariable - not
                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(</xsl:if><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueX" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueX" /> - </xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >);
                                <xsl:text>&#10;</xsl:text>
                                </xsl:if>
                                </xsl:for-each>
                                <xsl:text>                                </xsl:text><xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setY(</xsl:if><xsl:if test="position() = 4" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueY" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueY" /> - </xsl:if></xsl:if><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >);</xsl:if>
                                </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="contains($hasObjectVariable, 'found')" >
                                                        
                            //hasObjectVariable - found
                                <xsl:variable name="objectsFactory" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >.Variable((int) ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" />) <xsl:value-of select="$gameLayerName" />).</xsl:if></xsl:for-each></xsl:variable>

                                <xsl:variable name="paramX0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueX" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueX" /> - </xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramX" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramX0" /></xsl:with-param><xsl:with-param name="find" >.Variable(</xsl:with-param><xsl:with-param name="replacementText" ><xsl:value-of select="$objectsFactory" /></xsl:with-param></xsl:call-template></xsl:variable>
                                <xsl:variable name="paramY0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueY" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueY" /> - </xsl:if></xsl:if><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramY" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramY0" /></xsl:with-param><xsl:with-param name="find" >.Variable(</xsl:with-param><xsl:with-param name="replacementText" ><xsl:value-of select="$objectsFactory" /></xsl:with-param></xsl:call-template></xsl:variable>

                                <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), 'startX')" >//TWB - Hack for map y position basically the height of the map</xsl:if></xsl:if></xsl:for-each><xsl:text>&#10;</xsl:text>
                                
                                <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), 'startX')" >
                                    
                                    <xsl:call-template name="scale" >
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                    </xsl:call-template>

                                </xsl:if></xsl:if></xsl:for-each><xsl:text>&#10;</xsl:text>

                                <!-- &#42; scale-->
                                <xsl:variable name="mapPositionHackX" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), 'startX')" ></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="mapPositionHackY0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 5" ><xsl:if test="contains(text(), 'startY')" >(</xsl:if></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="mapPositionHackY" ><xsl:for-each select="parameters" ><xsl:if test="position() = 5" ><xsl:if test="contains(text(), 'startY')" >) + 36</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(<xsl:value-of select="$paramX" /><xsl:value-of select="$mapPositionHackX" />);<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                <xsl:text>                                </xsl:text><xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setY(<xsl:value-of select="$mapPositionHackY0" /><xsl:value-of select="$paramY" /><xsl:value-of select="$mapPositionHackY" />);</xsl:if></xsl:for-each>
                                    
                        </xsl:if>
                                

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                final Rectangle <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    pointFactory.getInstance(<xsl:value-of select="$name" />GDobject2.x, <xsl:value-of select="$name" />GDobject2.y),
                                    <xsl:value-of select="$name" />GDobject2.Width(globals.graphics) * scale, <xsl:value-of select="$name" />GDobject2.Height(globals.graphics) * scale);
                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>xsl:value-of select="$name" />RectangleList.add(<xsl:value-of select="$name" />Rectangle);
                                </xsl:if>

                            } catch(Exception e) {
                                //6
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        @Override
                        public boolean processG(final GDObject gdObject, final BasicArrayList gdGameLayerList, final int gdObjectIndex, final Graphics graphics) {

                            try {
                                super.processGStats(gdObject, graphics);
                        
                                final boolean result = this.processGPaint(gdObject, graphics);
                                
                                <xsl:if test="contains($isTextObject, 'found')" >
                                    //TextObject::Text - does not currently have a GameLayer
                                    //if(gdGameLayerList != null gdGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    //}
                                </xsl:if>
                                <xsl:if test="not(contains($isTextObject, 'found'))" >
                                    final GDGameLayer gameLayer = (GDGameLayer) gdGameLayerList.get(gdObjectIndex);
                                    //final GDObject gdObject = gameLayer.gdObject;
                                    gameLayer.updatePosition();
                                </xsl:if>
                                
                                return result;

                            } catch(Exception e) {
                                //6
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        @Override
                        public boolean processGS(final GDGameLayer gameLayer, final Graphics graphics) {

                            try {
                                super.processGStats(gameLayer.gdObject, graphics);
                        
                                final boolean result = this.processGPaint(gameLayer.gdObject, graphics);
                                
                                <xsl:if test="contains($isTextObject, 'found')" >
                                    //TextObject::Text - does not currently have a GameLayer
                                </xsl:if>
                                <xsl:if test="not(contains($isTextObject, 'found'))" >
                                    gameLayer.updatePosition();
                                </xsl:if>
                                
                                return result;

                            } catch(Exception e) {
                                //6
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        @Override
                        public boolean processGPaint(final GDObject gdObject, final Graphics graphics) {

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                //if(gdObject == null) {
                                //    LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "gdObject was null", this, commonStrings.PROCESS));
                                //    return;
                                //}
                            
                            <xsl:if test="string-length($parentConditionObject) > 0" >
                            <xsl:if test="not(contains($parentObjectHasObjectGroup, 'found'))" >
                                //Param from parent
                                final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$parentConditionObject" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$parentConditionObject" /><xsl:text> </xsl:text><xsl:value-of select="$parentConditionObject" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$parentConditionObject" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$parentConditionObject" />) gdObject;
                            </xsl:if>
                            
                            <xsl:if test="contains($parentObjectHasObjectGroup, 'found')" >
                                final GDObject <xsl:value-of select="$parentConditionObject" /> = gdObject;
                            </xsl:if>
                            </xsl:if>
                            <xsl:if test="string-length($parentConditionObject) = 0" >
                                //Param not from parent
                            <xsl:if test="not(contains($hasObjectGroup, 'found'))" >   
                                final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />) gdObject;
                            </xsl:if>
                            
                            <xsl:if test="contains($hasObjectGroup, 'found')" >
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                            </xsl:if>
                            </xsl:if>

                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS));

                    <xsl:for-each select="/game" >
                        <xsl:for-each select="objects" >
<!--                    //global name=<xsl:value-of select="name" />-->
                            <xsl:variable name="nameWithCall" ><xsl:value-of select="name" />.</xsl:variable>
                            <xsl:if test="not((string-length($parentConditionObject) > 0 and name = $parentConditionObject) or (string-length($parentConditionObject) = 0 and name = $name))" >
                            <xsl:if test="contains($parametersAsString, $nameWithCall)" >
                    if(gameGlobals.<xsl:value-of select="name" />GDGameLayerList.size() == 0) {
                        return false;
                    }

                    final GDGameLayer <xsl:value-of select="name" />GDGameLayer = (GDGameLayer) gameGlobals.<xsl:value-of select="name" />GDGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer.gdObject;
                    final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" />)<xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" />GDGameLayer.gdObject;
                            </xsl:if>
                            </xsl:if>
                            <xsl:if test="name = $parentConditionObject" >
                                //Method argument was already used to skipping - <xsl:value-of select="name" />
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:for-each select="layouts" >
                            <xsl:if test="$layoutIndex = position() -1" >

                        <xsl:for-each select="objectsGroups" >
                            
                            <xsl:if test="not((string-length($parentConditionObject) > 0 and name = $parentConditionObject) or (string-length($parentConditionObject) = 0 and name = $name))" >
                                //objectsGroups - <xsl:value-of select="name" />
<!--
                    final BasicArrayList gdGameLayerList = ((BasicArrayList) globals.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index));
                    if(gdGameLayerList.size() == 0) {
                        return false;
                    }

                    final GDGameLayer <xsl:value-of select="name" />GDGameLayer = (GDGameLayer) gdGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer.gdObject;
                    final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" />)<xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" />GDGameLayer.gdObject;
-->
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:for-each select="objects" >
                    //name=<xsl:value-of select="name" />
                            <xsl:variable name="nameWithCall" ><xsl:value-of select="name" />.</xsl:variable>
                            <xsl:if test="not((string-length($parentConditionObject) > 0 and name = $parentConditionObject) or (string-length($parentConditionObject) = 0 and name = $name))" >
                            <xsl:if test="contains($parametersAsString, $nameWithCall)" >
                    if(globals.<xsl:value-of select="name" />GDGameLayerList.size() == 0) {
                        return false;
                    }

                    final GDGameLayer <xsl:value-of select="name" />GDGameLayer = (GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer.gdObject;
                    final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" />)<xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="name" />GDGameLayer.gdObject;
                            </xsl:if>
                            </xsl:if>
                            <xsl:if test="name = $parentConditionObject" >
                                //Method argument was already used to skipping - <xsl:value-of select="name" />
                            </xsl:if>
                        </xsl:for-each>
                            </xsl:if>
                       </xsl:for-each>
                    </xsl:for-each>
                                
<!--                
                    <xsl:variable name="hasGameLayer2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), '.')" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="gameLayerName2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="gameLayerName3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName3=<xsl:value-of select="$gameLayerName3" />
                    <xsl:variable name="gameLayerName4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and contains(text(), '-')" ><xsl:value-of select="substring-after($gameLayerName3, '-')" /></xsl:if><xsl:if test="position() = 3 and not(contains($gameLayerName3, '-'))" ><xsl:value-of select="$gameLayerName3" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName4=<xsl:value-of select="$gameLayerName4" />
                    <xsl:variable name="gameLayerName" ><xsl:call-template name="substring-after-last" ><xsl:with-param name="string" ><xsl:value-of select="$gameLayerName4" /></xsl:with-param><xsl:with-param name="char" select="' '" /></xsl:call-template></xsl:variable>
                    //gameLayerName=<xsl:value-of select="$gameLayerName" />
-->

<!--                            
                               <xsl:variable name="existingValueX" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x</xsl:if></xsl:for-each></xsl:variable>
                               <xsl:variable name="existingValueY" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y</xsl:if></xsl:for-each></xsl:variable>
-->
                                
<!--                        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable(')" >found</xsl:if></xsl:for-each></xsl:variable>-->

                        <xsl:if test="not(contains($hasObjectVariable, 'found'))" >
                                                                        
                            //hasObjectVariable - not
                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(</xsl:if><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueX" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueX" /> - </xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >);
                                <xsl:text>&#10;</xsl:text>
                                </xsl:if>
                                </xsl:for-each>
                                <xsl:text>                                </xsl:text><xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setY(</xsl:if><xsl:if test="position() = 4" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueY" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueY" /> - </xsl:if></xsl:if><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >);</xsl:if>
                                </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="contains($hasObjectVariable, 'found')" >
                                                        
                            //hasObjectVariable - found
                                <xsl:variable name="objectsFactory" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >.Variable((int) ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" />) <xsl:value-of select="$gameLayerName" />).</xsl:if></xsl:for-each></xsl:variable>

                                <xsl:variable name="paramX0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueX" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueX" /> - </xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramX" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramX0" /></xsl:with-param><xsl:with-param name="find" >.Variable(</xsl:with-param><xsl:with-param name="replacementText" ><xsl:value-of select="$objectsFactory" /></xsl:with-param></xsl:call-template></xsl:variable>
                                <xsl:variable name="paramY0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueY" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueY" /> - </xsl:if></xsl:if><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramY" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramY0" /></xsl:with-param><xsl:with-param name="find" >.Variable(</xsl:with-param><xsl:with-param name="replacementText" ><xsl:value-of select="$objectsFactory" /></xsl:with-param></xsl:call-template></xsl:variable>

                                <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), 'startX')" >//TWB - Hack for map y position basically the height of the map</xsl:if></xsl:if></xsl:for-each><xsl:text>&#10;</xsl:text>
                                
                                <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), 'startX')" >
                                </xsl:if></xsl:if></xsl:for-each><xsl:text>&#10;</xsl:text>

                                <!-- &#42; scale-->
                                <xsl:variable name="mapPositionHackX" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), 'startX')" ></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="mapPositionHackY0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 5" ><xsl:if test="contains(text(), 'startY')" >(</xsl:if></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="mapPositionHackY" ><xsl:for-each select="parameters" ><xsl:if test="position() = 5" ><xsl:if test="contains(text(), 'startY')" >) + 36</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(<xsl:value-of select="$paramX" /><xsl:value-of select="$mapPositionHackX" />);<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                <xsl:text>                                </xsl:text><xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setY(<xsl:value-of select="$mapPositionHackY0" /><xsl:value-of select="$paramY" /><xsl:value-of select="$mapPositionHackY" />);</xsl:if></xsl:for-each>
                                    
                        </xsl:if>
                                

<!--                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>-->
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                final Rectangle <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    pointFactory.getInstance(<xsl:value-of select="$name" />GDobject2.x, <xsl:value-of select="$name" />GDobject2.y),
                                    <xsl:value-of select="$name" />GDobject2.Width(globals.graphics) * scale, <xsl:value-of select="$name" />GDobject2.Height(globals.graphics) * scale);
                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>xsl:value-of select="$name" />RectangleList.add(<xsl:value-of select="$name" />Rectangle);
                                </xsl:if>

                            } catch(Exception e) {
                                //6
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

    </xsl:template>

</xsl:stylesheet>
