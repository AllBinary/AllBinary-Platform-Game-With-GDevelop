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

    <xsl:template name="mettreXYActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="instancesAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>                
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>

        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="siblingOrParentOrList" ><xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList0" ><xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList0" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GDGameLayer </xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayer = </xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = </xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList2" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>if(</xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayerList</xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//if(<xsl:value-of select="$name" />GDGameLayerList</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList3" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GD</xsl:text>GlobalsGDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text> = (GDGlobalsGDObjectsFactory.</xsl:text><xsl:value-of select="$name" /><xsl:text></xsl:text>) <xsl:value-of select="$name" /><xsl:text></xsl:text>GDGameLayer.gdObject;</xsl:with-param><xsl:with-param name="replacementText" >//final GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" /> <xsl:value-of select="$name" /> = (GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrListOnlyListForTheMainParam" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList4" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text> = (GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text></xsl:text>) <xsl:value-of select="$name" /><xsl:text></xsl:text>GDGameLayer.gdObject;</xsl:with-param><xsl:with-param name="replacementText" >//final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /> <xsl:value-of select="$name" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;</xsl:with-param></xsl:call-template></xsl:variable>

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

                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 3" >
                                    <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                    <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                        <xsl:variable name="objectName" >
                                            <xsl:value-of select="substring-before(substring-after(text(), 'SceneInstancesCount('), ')')" />
                                        </xsl:variable>
                                        <xsl:call-template name="string-replace-all" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="text()" />
                                            </xsl:with-param>
                                            <xsl:with-param name="find" >SceneInstancesCount(<xsl:value-of select="$objectName" /></xsl:with-param>
                                            <xsl:with-param name="replacementText" >SceneInstancesCount(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectName" />GDGameLayerList.size()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                                                
                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

                        <xsl:variable name="hasObject3" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup3" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found')" >
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
                        </xsl:if>

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

                    <xsl:variable name="gameLayerName2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="gameLayerName3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName3=<xsl:value-of select="$gameLayerName3" />
                    <xsl:variable name="gameLayerName4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and contains(text(), '-')" ><xsl:value-of select="substring-after($gameLayerName3, '-')" /></xsl:if><xsl:if test="position() = 3 and not(contains($gameLayerName3, '-'))" ><xsl:value-of select="$gameLayerName3" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName4=<xsl:value-of select="$gameLayerName4" />
                    <xsl:variable name="gameLayerName" ><xsl:call-template name="after-lastIndexOf" ><xsl:with-param name="string" ><xsl:value-of select="$gameLayerName4" /></xsl:with-param><xsl:with-param name="char" select="' '" /></xsl:call-template></xsl:variable>
                    //gameLayerName=<xsl:value-of select="$gameLayerName" />

                        //SetXY - was //MettreXY - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        public boolean process() {

                            //boolean result = false;

                            try {
                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                            final GDGameLayer[] gameLayerArray = gameGlobals.tempGameLayerArray;      
                            <xsl:value-of select="$siblingOrParentOrListOnlyListForTheMainParam" />
                            
                            final int size2 = <xsl:value-of select="$name" />GDGameLayerList.size();

                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + size2, this, commonStrings.PROCESS);
                            
                            GDGameLayer <xsl:value-of select="$name" />GDGameLayer;
                            <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;
                            for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                <xsl:value-of select="$name" />GDGameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index2);
                                <xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                //result = result <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> 

                                <xsl:call-template name="mettreXYActionProcessGDObject2" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="parentConditionObject" ><xsl:value-of select="$parentConditionObject" /></xsl:with-param>
                                    <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                                    <xsl:with-param name="param" ><xsl:value-of select="$param" /></xsl:with-param>
                                    <xsl:with-param name="gameLayerName" ><xsl:value-of select="$gameLayerName" /></xsl:with-param>
                                    <xsl:with-param name="hasObject3" ><xsl:value-of select="$hasObject3" /></xsl:with-param>
                                    <xsl:with-param name="hasObjectGroup3" ><xsl:value-of select="$hasObjectGroup3" /></xsl:with-param>
                                    <xsl:with-param name="beforeSecondParam" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param>
                                    <xsl:with-param name="objectsGroupsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param>
                                    <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                                    <xsl:with-param name="instancesAsString" ><xsl:value-of select="$instancesAsString" /></xsl:with-param>
                                </xsl:call-template>

                                <xsl:value-of select="$name" />GDGameLayer.updatePosition();

                            }

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            //return result;
                            return true;

                        }

                        //SetXY
                        public boolean process(final int index2) {

                            //boolean result = false;

                            try {

                                //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index2, this, commonStrings.PROCESS);

                            final GDGameLayer[] gameLayerArray = gameGlobals.tempGameLayerArray;      
                            <xsl:value-of select="$siblingOrParentOrListOnlyListForTheMainParam" />

                            GDGameLayer <xsl:value-of select="$name" />GDGameLayer;
                            <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;
                            
                                <xsl:value-of select="$name" />GDGameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index2);
                                <xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                //result = result <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> 
                                
                                <xsl:call-template name="mettreXYActionProcessGDObject2" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="parentConditionObject" ><xsl:value-of select="$parentConditionObject" /></xsl:with-param>
                                    <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                                    <xsl:with-param name="param" ><xsl:value-of select="$param" /></xsl:with-param>
                                    <xsl:with-param name="gameLayerName" ><xsl:value-of select="$gameLayerName" /></xsl:with-param>
                                    <xsl:with-param name="hasObject3" ><xsl:value-of select="$hasObject3" /></xsl:with-param>
                                    <xsl:with-param name="hasObjectGroup3" ><xsl:value-of select="$hasObjectGroup3" /></xsl:with-param>
                                    <xsl:with-param name="beforeSecondParam" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param>
                                    <xsl:with-param name="objectsGroupsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param>
                                    <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                                    <xsl:with-param name="instancesAsString" ><xsl:value-of select="$instancesAsString" /></xsl:with-param>
                                </xsl:call-template>

                                <xsl:value-of select="$name" />GDGameLayer.updatePosition();

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            //return result;
                            return true;
                        }

                    @Override
                    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                        super.processStats(motionGestureEvent);
                        
                        //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                        
                        return this.process();
                    }

                        @Override
                        public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
                            try {

                                <xsl:value-of select="$siblingOrParentOrList" />

                                boolean result = true;
                                <xsl:call-template name="mettreXYActionProcessGDObject" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="parentConditionObject" ><xsl:value-of select="$parentConditionObject" /></xsl:with-param>
                                    <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                                    <xsl:with-param name="param" ><xsl:value-of select="$param" /></xsl:with-param>
                                    <xsl:with-param name="gameLayerName" ><xsl:value-of select="$gameLayerName" /></xsl:with-param>
                                    <xsl:with-param name="hasObject3" ><xsl:value-of select="$hasObject3" /></xsl:with-param>
                                    <xsl:with-param name="hasObjectGroup3" ><xsl:value-of select="$hasObjectGroup3" /></xsl:with-param>
                                    <xsl:with-param name="beforeSecondParam" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param>
                                    <xsl:with-param name="objectsGroupsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param>
                                    <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                                    <xsl:with-param name="instancesAsString" ><xsl:value-of select="$instancesAsString" /></xsl:with-param>
                                </xsl:call-template>

                                //final GDGameLayer gameLayer = (GDGameLayer) gdGameLayerList.get(gdObjectIndex);
                                //final GDObject gdObject = gameLayer.gdObject;
                                //gameLayer.updatePosition();
                                                                
                                return result;
              
                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }
                            return true;
                        }

                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        @Override
                        public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                            
                            //Map from object array with action params
                            final GDGameLayer gameLayer = (GDGameLayer) objectArray[1];
                            this.process(gameLayer, intArray[3], intArray[5]);
                            gameLayer.updatePosition();

                            return true;
                        }
                        </xsl:if>

                        public void process(final GDGameLayer gameLayer, final int x, final int y) {
                            final GDObject gdObject = gameLayer.gdObject;
                            this.process(gdObject, x, y);
                        }

                        public void process(final GDObject gdObject, final int x, final int y) {
                            gdObject.setX(x);
                            gdObject.setY(y);
                        }

    </xsl:template>

    <xsl:template name="mettreXYActionProcessGDObject2" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parentConditionObject" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="param" />
        <xsl:param name="gameLayerName" />
        <xsl:param name="hasObject3" />
        <xsl:param name="hasObjectGroup3" />
        <xsl:param name="beforeSecondParam" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="instancesAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>                
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                            //mettreXYActionProcessGDObject2 - START

                                //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS);
                                
                    <xsl:variable name="hasGameLayer2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), '.')" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                                <xsl:variable name="existingValueX" ><xsl:value-of select="$name" />.x</xsl:variable>
                                <xsl:variable name="existingValueY" ><xsl:value-of select="$name" />.y</xsl:variable>
                                
                        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable(')" >found</xsl:if></xsl:for-each></xsl:variable>

                        <xsl:if test="not(contains($hasObjectVariable, 'found'))" >
                                                                        
                            //hasObjectVariable - not
                            this.process(<xsl:value-of select="$name" />, 
                            (int) (<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueX" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueX" /> - </xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="$param" /></xsl:if></xsl:for-each>),
                            (int) (<xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueY" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueY" /> - </xsl:if></xsl:if><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>));

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

                            //mettreXYActionProcessGDObject2 - END
    </xsl:template>

    <xsl:template name="mettreXYActionProcessGDObject" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parentConditionObject" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="param" />
        <xsl:param name="gameLayerName" />
        <xsl:param name="hasObject3" />
        <xsl:param name="hasObjectGroup3" />
        <xsl:param name="beforeSecondParam" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="instancesAsString" />

                            //mettreXYActionProcessGDObject - START
        
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>
        <xsl:variable name="existingValueX" ><xsl:value-of select="$name" />.x</xsl:variable>
        <xsl:variable name="existingValueY" ><xsl:value-of select="$name" />.y</xsl:variable>
        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable(')" >found</xsl:if></xsl:for-each></xsl:variable>

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

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found')" >
                                <xsl:value-of select="$beforeSecondParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>
                
                    <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>                    
                    //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                    //paramTwoName=<xsl:value-of select="$paramTwoName" />
                    //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />

                    <xsl:variable name="hasForEachProcessGD" >
                        <xsl:call-template name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasDistanceProcessGD" >
                        <xsl:call-template name="hasDistanceProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    
                    <xsl:variable name="hasKnownParamsFromParent" ><xsl:if test="contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >found</xsl:if></xsl:variable>

                                //logUtil.putF(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                //logUtil.put(<xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS);

                        <xsl:if test="not(contains($hasObjectVariable, 'found'))" >
                                                                        
                            //hasObjectVariable - not
                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(</xsl:if><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueX" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueX" /> - </xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="$param" /></xsl:if><xsl:if test="position() = last()" >);
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

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                <xsl:value-of select="$name" />.setX(<xsl:value-of select="$paramX" /><xsl:value-of select="$mapPositionHackX" />);<xsl:text>&#10;</xsl:text>
                                <xsl:text>                                </xsl:text>
                                <xsl:value-of select="$name" />.setY(<xsl:value-of select="$mapPositionHackY0" /><xsl:value-of select="$paramY" /><xsl:value-of select="$mapPositionHackY" />);
                                    
                        </xsl:if>

                    <xsl:for-each select="/game" >
                        <xsl:for-each select="objects" >
                            <xsl:variable name="nameWithCall" ><xsl:value-of select="name" />.</xsl:variable>
                            <xsl:if test="not((string-length($parentConditionObject) > 0 and name = $parentConditionObject) or (string-length($parentConditionObject) = 0 and name = $name))" >
                            <xsl:if test="contains($parametersAsString, $nameWithCall)" >
                            <xsl:value-of select="name" />GDGameLayer.updatePosition();
                            </xsl:if>
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:for-each select="layouts" >
                            <xsl:if test="$layoutIndex = position() -1" >

                        <xsl:for-each select="objectsGroups" >                            
                            <xsl:if test="not((string-length($parentConditionObject) > 0 and name = $parentConditionObject) or (string-length($parentConditionObject) = 0 and name = $name))" >

                            </xsl:if>
                        </xsl:for-each>

                        <xsl:for-each select="objects" >
                            <xsl:variable name="nameWithCall" ><xsl:value-of select="name" />.</xsl:variable>
                            <xsl:if test="not((string-length($parentConditionObject) > 0 and name = $parentConditionObject) or (string-length($parentConditionObject) = 0 and name = $name))" >
                            <xsl:if test="contains($parametersAsString, $nameWithCall)" >
                            <xsl:value-of select="name" />GDGameLayer.updatePosition();
                            </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                            </xsl:if>
                       </xsl:for-each>
                    </xsl:for-each>                                                                

                            //mettreXYActionProcessGDObject - END
    </xsl:template>

</xsl:stylesheet>
