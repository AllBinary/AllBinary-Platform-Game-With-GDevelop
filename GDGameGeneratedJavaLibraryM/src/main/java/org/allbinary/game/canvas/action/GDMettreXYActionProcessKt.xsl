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
        <xsl:variable name="siblingOrParentOrList2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList0" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>val </xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayer: GDGameLayer = </xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//val <xsl:value-of select="$name" />GDGameLayer: GDGameLayer = </xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList2" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>if(</xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayerList</xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//if(<xsl:value-of select="$name" />GDGameLayerList</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList3" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>val </xsl:text><xsl:value-of select="$name" /><xsl:text>: GDGlobalsGDObjectsFactory.</xsl:text><xsl:value-of select="$name" /><xsl:text> = </xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayer.gdObject as GDGlobalsGDObjectsFactory.</xsl:text><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="replacementText" >//val <xsl:value-of select="$name" />: GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject as GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" /></xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrListOnlyListForTheMainParamIncludeList" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList4" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>val </xsl:text><xsl:value-of select="$name" /><xsl:text>: GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> = </xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayer.gdObject as GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="replacementText" >//val <xsl:value-of select="$name" />: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /></xsl:with-param></xsl:call-template></xsl:variable>

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

                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:call-template name="addGlobalsForVariables" ><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>

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
                        fun process(): Boolean {

                            //var result: Boolean = false

                            try {
                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            val gameLayerArray: Array&lt;GDGameLayer&gt; = gameGlobals.tempGameLayerArray
                            <xsl:value-of select="$siblingOrParentOrListOnlyListForTheMainParamIncludeList" />

                            val size2: Int = <xsl:value-of select="$name" />GDGameLayerList.size()

                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + size2, this, this.commonStrings.PROCESS)

                            lateinit var <xsl:value-of select="$name" />GDGameLayer: GDGameLayer
                            lateinit var <xsl:value-of select="$name" />: <xsl:value-of select="$gdObjectFactory" />
                            for(index2 in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size2) {
                                <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$name" />GDGameLayerList.get(index2) as GDGameLayer
                                <xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject as <xsl:value-of select="$gdObjectFactory" />
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

                                <xsl:value-of select="$name" />GDGameLayer.updatePosition()

                                <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template>

                            }

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }

                            return true

                        }

                        //SetXY
                        fun process(index2: Int): Boolean {

                            //var result: Boolean = false

                            try {

                                //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index2, this, this.commonStrings.PROCESS)

                            val gameLayerArray: Array&lt;GDGameLayer&gt; = gameGlobals.tempGameLayerArray
                            <xsl:value-of select="$siblingOrParentOrListOnlyListForTheMainParamIncludeList" />

                            lateinit var <xsl:value-of select="$name" />GDGameLayer: GDGameLayer
                            lateinit var <xsl:value-of select="$name" />: <xsl:value-of select="$gdObjectFactory" />

                                <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$name" />GDGameLayerList.get(index2) as GDGameLayer
                                <xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject as <xsl:value-of select="$gdObjectFactory" />
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

                                <xsl:value-of select="$name" />GDGameLayer.updatePosition()

                                <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template>

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }

                            return true
                        }


                    override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                        super.processStats(motionGestureEvent)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        return this.process()
                    }


                        override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                            try {

                                <xsl:value-of select="$siblingOrParentOrList" />

                                var result: Boolean = true
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

                                <xsl:value-of select="$name" />GDGameLayer.updatePosition()

                                <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }
                            return true
                        }

                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >

                        override fun process(objectArray: Array&lt;Object&gt;, intArray: IntArray, longArray: LongArray, floatArray: FloatArray): Boolean {

                            //Map from object array with action params
                            val gameLayer: GDGameLayer = objectArray[1] as GDGameLayer
                            this.process(gameLayer, intArray[3], intArray[5])
                            gameLayer.updatePosition()

                            return true
                        }
                        </xsl:if>

                        fun process(gameLayer: GDGameLayer, x: Int, y: Int) {
                            val gdObject: GDObject = gameLayer.gdObject
                            this.process(gdObject, x, y)
                        }

                        fun process(gdObject: GDObject, x: Int, y: Int) {
                            gdObject.setX(x)
                            gdObject.setY(y)
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

                                //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:value-of select="$name" />.toString(), this, this.commonStrings.PROCESS)

                    <xsl:variable name="hasGameLayer2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), '.')" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                                <xsl:variable name="existingValueX" ><xsl:value-of select="$name" />.x</xsl:variable>
                                <xsl:variable name="existingValueY" ><xsl:value-of select="$name" />.y</xsl:variable>

                        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable(')" >found</xsl:if></xsl:for-each></xsl:variable>

                        <xsl:if test="not(contains($hasObjectVariable, 'found'))" >

                            //hasObjectVariable - not
                            this.process(<xsl:value-of select="$name" />,
                            (<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueX" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueX" /> - </xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="$param" /></xsl:if></xsl:for-each>).toInt(),
                            (<xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueY" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueY" /> - </xsl:if></xsl:if><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>).toInt())

                        </xsl:if>

                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                            //hasObjectVariable - found
                                <xsl:variable name="objectsFactory" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >.Variable((<xsl:value-of select="$gameLayerName" /> as GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" />).</xsl:if></xsl:for-each></xsl:variable>

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
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(<xsl:value-of select="$paramX" /><xsl:value-of select="$mapPositionHackX" />)<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                <xsl:text>                                </xsl:text><xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setY(<xsl:value-of select="$mapPositionHackY0" /><xsl:value-of select="$paramY" /><xsl:value-of select="$mapPositionHackY" />)</xsl:if></xsl:for-each>

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

                                //this.logUtil.putF(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                                //this.logUtil.put(<xsl:value-of select="$name" />.toString(), this, this.commonStrings.PROCESS)

                        <xsl:if test="not(contains($hasObjectVariable, 'found'))" >

                            //hasObjectVariable - not
                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(</xsl:if><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueX" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueX" /> - </xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="$param" /></xsl:if><xsl:if test="position() = last()" >)
                                <xsl:text>&#10;</xsl:text>
                                </xsl:if>
                                </xsl:for-each>
                                <xsl:text>                                </xsl:text><xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setY(</xsl:if><xsl:if test="position() = 4" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValueY" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValueY" /> - </xsl:if></xsl:if><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >)</xsl:if>
                                </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                            //hasObjectVariable - found
                                <xsl:variable name="objectsFactory" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >.Variable((<xsl:value-of select="$gameLayerName" /> as GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" />).</xsl:if></xsl:for-each></xsl:variable>

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

                                <xsl:value-of select="$name" />.setX(<xsl:value-of select="$paramX" /><xsl:value-of select="$mapPositionHackX" />)<xsl:text>&#10;</xsl:text>
                                <xsl:text>                                </xsl:text>
                                <xsl:value-of select="$name" />.setY(<xsl:value-of select="$mapPositionHackY0" /><xsl:value-of select="$paramY" /><xsl:value-of select="$mapPositionHackY" />)

                        </xsl:if>

                    <xsl:for-each select="/game" >
                        <xsl:for-each select="objects" >
                            <xsl:variable name="nameWithCall" ><xsl:value-of select="name" />.</xsl:variable>
                            <xsl:if test="not((string-length($parentConditionObject) > 0 and name = $parentConditionObject) or (string-length($parentConditionObject) = 0 and name = $name))" >
                            <xsl:if test="contains($parametersAsString, $nameWithCall)" >
                            <xsl:value-of select="name" />GDGameLayer.updatePosition()
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
                            <xsl:value-of select="name" />GDGameLayer.updatePosition()
                            </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                            </xsl:if>
                       </xsl:for-each>
                    </xsl:for-each>

                            //mettreXYActionProcessGDObject - END
    </xsl:template>

</xsl:stylesheet>
