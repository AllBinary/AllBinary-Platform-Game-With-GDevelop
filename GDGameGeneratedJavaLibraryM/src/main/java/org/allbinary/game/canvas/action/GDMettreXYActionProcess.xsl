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

                        //MettreXY
                        public boolean process() {

                            //boolean result = false;

                            <xsl:variable name="objectGroup" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $name" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                        <!--
                                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                                        <xsl:if test="number($layoutIndex2) = $layoutIndex" > 
                                        -->
                                        <!--</xsl:if>-->
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>

                            <xsl:if test="string-length($objectGroup) > 0" >
                            final int size = globals.<xsl:value-of select="$name" />GDObjectListOfList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            final BasicArrayList gdObjectList = ((BasicArrayList) globals.<xsl:value-of select="$name" />GDObjectListOfList.get(index));
                            final BasicArrayList gdGameLayerList = ((BasicArrayList) globals.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index));
                            </xsl:if>
                            <xsl:if test="string-length($objectGroup) = 0" >
                            final BasicArrayList gdObjectList = globals.<xsl:value-of select="$name" />GDObjectList;
                            final BasicArrayList gdGameLayerList = globals.<xsl:value-of select="$name" />GDGameLayerList;
                            </xsl:if>

                            final int size2 = gdObjectList.size();
                            //if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                            //    result = true;
                            //}

                            for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                            //if(gdObjectList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                final GDObject gdObject = (GDObject) gdObjectList.get(index2);
                                //result = result <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> 
                                this.processG(gdObject, globals.graphics);

                                //if(gdGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    final GDGameLayer gameLayer = (GDGameLayer) gdGameLayerList.get(index2);
                                    //final GDObject gdObject = gameLayer.gdObject;
                                    gameLayer.updatePosition();
                                //}

                            //}
                            }

                            <xsl:if test="string-length($objectGroup) > 0" >
                            }
                            </xsl:if>

                            //return result;
                            return true;
                        }

                        @Override
                        public boolean processG(final GDObject gdObject, final Graphics graphics) {

                            try {
                                super.processGStats(gdObject, graphics);
                        
                                return this.processGPaint(gdObject, graphics);
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
                                
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS));

                    <xsl:variable name="hasGameLayer2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), '.')" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="gameLayerName2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="gameLayerName3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName3=<xsl:value-of select="$gameLayerName3" />
                    <xsl:variable name="gameLayerName4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and contains(text(), '-')" ><xsl:value-of select="substring-after($gameLayerName3, '-')" /></xsl:if><xsl:if test="position() = 3 and not(contains($gameLayerName3, '-'))" ><xsl:value-of select="$gameLayerName3" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName4=<xsl:value-of select="$gameLayerName4" />
                    <xsl:variable name="gameLayerName" ><xsl:call-template name="substring-after-last" ><xsl:with-param name="string" ><xsl:value-of select="$gameLayerName4" /></xsl:with-param><xsl:with-param name="char" select="' '" /></xsl:call-template></xsl:variable>
                    //gameLayerName=<xsl:value-of select="$gameLayerName" />

                    <xsl:if test="contains($hasGameLayer2, 'found')" >
                    <xsl:if test="not($gameLayerName = $gameLayerName2 or substring($gameLayerName, 2, string-length($gameLayerName)) = $gameLayerName2)" >
                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="$gameLayerName" /> = <xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                    final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$gameLayerName" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$gameLayerName" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$gameLayerName" />)<xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                    </xsl:if>
                    </xsl:if>

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
                                <xsl:variable name="objectsFactory" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >.Variable((int) ((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$gameLayerName" />) <xsl:value-of select="$gameLayerName" />).</xsl:if></xsl:for-each></xsl:variable>

                                <xsl:variable name="paramX0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueX" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueX" /> - </xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramX" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramX0" /></xsl:with-param><xsl:with-param name="find" >.Variable(</xsl:with-param><xsl:with-param name="replacementText" ><xsl:value-of select="$objectsFactory" /></xsl:with-param></xsl:call-template></xsl:variable>
                                <xsl:variable name="paramY0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueY" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueY" /> - </xsl:if></xsl:if><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramY" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramY0" /></xsl:with-param><xsl:with-param name="find" >.Variable(</xsl:with-param><xsl:with-param name="replacementText" ><xsl:value-of select="$objectsFactory" /></xsl:with-param></xsl:call-template></xsl:variable>

                                <xsl:variable name="mapPositionHackX" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), 'startX')" > &#42; 2.15f</xsl:if></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="mapPositionHackY" ><xsl:for-each select="parameters" ><xsl:if test="position() = 5" ><xsl:if test="contains(text(), 'startY')" > &#42; 2.00f</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(<xsl:value-of select="$paramX" /><xsl:value-of select="$mapPositionHackX" />);<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                <xsl:text>                                </xsl:text><xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setY(<xsl:value-of select="$paramY" /><xsl:value-of select="$mapPositionHackY" />);</xsl:if></xsl:for-each>
                                    
                        </xsl:if>
                                

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                final Rectangle <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />GDobject2.x, <xsl:value-of select="$name" />GDobject2.y),
                                    <xsl:value-of select="$name" />GDobject2.Width(globals.graphics), <xsl:value-of select="$name" />GDobject2.Height(globals.graphics));
                                globals.<xsl:value-of select="$name" />RectangleList.add(<xsl:value-of select="$name" />Rectangle);
                                </xsl:if>

                            } catch(Exception e) {
                                //6
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

    </xsl:template>

</xsl:stylesheet>
