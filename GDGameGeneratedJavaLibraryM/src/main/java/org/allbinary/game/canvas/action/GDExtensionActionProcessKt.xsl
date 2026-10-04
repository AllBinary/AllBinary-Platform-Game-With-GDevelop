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

    <xsl:template name="extensionActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="extensionNameAndExtensionFunction" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable')" >found</xsl:if></xsl:for-each></xsl:variable>

        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

        <xsl:variable name="hasVariable" >
            <xsl:for-each select="/game">
                <xsl:for-each select="variables" >
                    <xsl:if test="name = $name" >found</xsl:if>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="/game">
                <xsl:for-each select="layouts" >
                    <xsl:for-each select="variables" >
                        <xsl:if test="name = $name" >found</xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="hasObject" >
            <xsl:for-each select="/game">
                <xsl:for-each select="objects" >
                    <xsl:if test="name = $name" >found</xsl:if>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="/game">
                <xsl:for-each select="layouts" >
                    <xsl:for-each select="objects" >
                        <xsl:if test="name = $name" >found</xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="hasObjectGroup2" >
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

        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>

                    private val objectArray: Array&lt;Object?&gt; = arrayOfNulls&lt;Object&gt;(<xsl:value-of select="count(parameters) + 1" />)
                    private val intArray: IntArray = IntArray(<xsl:value-of select="count(parameters) + 1" />)

                    <xsl:if test="not(contains($forExtension, 'found'))" >
                    //extension=<xsl:value-of select="$extensionNameAndExtensionFunction" /> - //Called from outside of Extension

                    override fun process(): Boolean {
                        super.processStats()

                        try {

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        <xsl:if test="type/value = 'AllBinaryGenerate::GenerateAsJavaScript'" >
                        //TWB - Hack as GDevelop does not have this
                        //"G:\\mnt\\bc\\mydev\\GDGamesP\\platformx\\j2se\\GDGameJ2SEWithSWTJOGLGraalJSFastBuildApplicationM\\..\\"
                        val xslPath: String = "..\\"
                        val genPath: String = "C:\\1json\\gen\\"
                        val projectPath: String = "C:\\1json\\"
                        GetJsAtRuntime().getAllJs(projectPath, genPath, xslPath)
                        </xsl:if>

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup2, 'found')" >
                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
                        val <xsl:value-of select="$name" />GDGameLayerListOfList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList
                        val size3: Int = <xsl:value-of select="$name" />GDGameLayerListOfList.size()
                        for(index3 in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size3) {
                            val <xsl:value-of select="$name" />GDGameLayerList: BasicArrayList = (<xsl:value-of select="$name" />GDGameLayerListOfList.get(index3) as BasicArrayList)
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >
                            val <xsl:value-of select="$name" />GDGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList
                        </xsl:if>
                            val size: Int = <xsl:value-of select="$name" />GDGameLayerList.size()
                            lateinit var <xsl:value-of select="$name" />GDGameLayer: GDGameLayer
                            //<xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text>&#10;</xsl:text>
                            for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {

                                <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                //fourthParam=<xsl:value-of select="$fourthParam" />
                                <xsl:variable name="fourthParam2" ><xsl:value-of select="$name" />GDGameLayer.gdObject.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>

                                <xsl:text>&#10;</xsl:text>
                                <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$name" />GDGameLayerList.get(index) as GDGameLayer
                                //<xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$name" />GDGameLayer.gdObject

                                <xsl:call-template name="extensionMapping" >
                                    <xsl:with-param name="extensionNameAndExtensionFunction" ><xsl:value-of select="$extensionNameAndExtensionFunction" /></xsl:with-param>
                                    <xsl:with-param name="objectOverride" ><xsl:value-of select="$name" />GDGameLayer</xsl:with-param>
                                </xsl:call-template>

                                <xsl:if test="not(contains($forExtension, 'found'))" >gdExtensionGDNodes.</xsl:if><xsl:value-of select="translate(type/value, ':', '_')" />GDNode.process(objectArray, intArray, null, null)

                            }
                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
                        }
                        </xsl:if>
                        </xsl:if>

                        } catch(e: Exception) {
                            this.logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                        }

                        return true
                    }


                    override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                        super.processStats(motionGestureEvent)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        return this.process()
                    }


                    override fun process(index: Int): Boolean {
                        super.processStats(index)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, this.commonStrings.PROCESS)

                        <xsl:if test="type/value = 'AllBinaryGenerate::GenerateAsJavaScript'" >
                        //TWB - Hack as GDevelop does not have this
                        //"G:\\mnt\\bc\\mydev\\GDGamesP\\platformx\\j2se\\GDGameJ2SEWithSWTJOGLGraalJSFastBuildApplicationM\\..\\"
                        val xslPath: String = "..\\"
                        val genPath: String = "C:\\1json\\gen\\"
                        val projectPath: String = "C:\\1json\\"
                        GetJsAtRuntime().getAllJs(projectPath, genPath, xslPath)
                        </xsl:if>

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup2, 'found')" >

                        <xsl:if test="contains($hasObjectGroup2, 'found')" >

                            //val gdObjectList2: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index) as BasicArrayList
                            val <xsl:value-of select="$name" />GDGameLayerList: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index) as BasicArrayList)
                            val size: Int = <xsl:value-of select="$name" />GDGameLayerList.size()
                            lateinit var <xsl:value-of select="$name" />GDGameLayer: GDGameLayer
                            <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text>&#10;</xsl:text>

                        for(index2 in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {

                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //.ObjectName()
                            //fourthParam=<xsl:value-of select="$fourthParam" />

                            <xsl:variable name="fourthParam2" >gameLayer.gdObject.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>

                            <xsl:text>&#10;</xsl:text>
                            <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$name" />GDGameLayerList.get(index2) as GDGameLayer
                            //<xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$name" />GDGameLayer.gdObject

                            <xsl:call-template name="extensionMapping" >
                                <xsl:with-param name="extensionNameAndExtensionFunction" ><xsl:value-of select="$extensionNameAndExtensionFunction" /></xsl:with-param>
                                <xsl:with-param name="objectOverride" ><xsl:value-of select="$name" />GDGameLayer</xsl:with-param>
                            </xsl:call-template>

                            <xsl:if test="not(contains($forExtension, 'found'))" >gdExtensionGDNodes.</xsl:if><xsl:value-of select="translate(type/value, ':', '_')" />GDNode.process(objectArray, intArray, null, null)


                        }
                        </xsl:if>

                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >

                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:value-of select="text()" /></xsl:variable>
                        <xsl:if test="position() = 1" >if(index <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()) return false<xsl:text>&#10;</xsl:text></xsl:if>
                        <xsl:if test="position() = 1" >val gameLayer: GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index) as GDGameLayer</xsl:if><xsl:if test="position() = last()" ></xsl:if>
                        </xsl:for-each>

                        <xsl:call-template name="extensionMapping" >
                            <xsl:with-param name="extensionNameAndExtensionFunction" ><xsl:value-of select="$extensionNameAndExtensionFunction" /></xsl:with-param>
                        </xsl:call-template>

                        <xsl:if test="not(contains($forExtension, 'found'))" >gdExtensionGDNodes.</xsl:if><xsl:value-of select="translate(type/value, ':', '_')" />GDNode.process(objectArray, intArray, null, null)

                        </xsl:if>

                        </xsl:if>

                        return true
                    }


                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                        super.processGDStats(gameLayerArray)
                        try {

                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        <xsl:call-template name="extensionMapping" >
                            <xsl:with-param name="extensionNameAndExtensionFunction" ><xsl:value-of select="$extensionNameAndExtensionFunction" /></xsl:with-param>
                            <xsl:with-param name="objectOverride" ><xsl:value-of select="$name" />GDGameLayer</xsl:with-param>
                        </xsl:call-template>

                        <xsl:if test="not(contains($forExtension, 'found'))" >gdExtensionGDNodes.</xsl:if><xsl:value-of select="translate(type/value, ':', '_')" />GDNode.process(objectArray, intArray, null, null)

                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        } catch(e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                        }

                        return true
                    }

                    </xsl:if>
                    <xsl:if test="contains($forExtension, 'found')" >
                    //extension=<xsl:value-of select="$extensionNameAndExtensionFunction" /> - //Called from inside of Extension

                    override fun process(objectArray: Array&lt;Object&gt;, intArray: IntArray, longArray: LongArray, floatArray: FloatArray): Boolean {

                        //Map from object array with action params
                        <xsl:call-template name="extensionMapping" >
                            <xsl:with-param name="extensionNameAndExtensionFunction" ><xsl:value-of select="$extensionNameAndExtensionFunction" /></xsl:with-param>
                        </xsl:call-template>

                        return <xsl:value-of select="translate(type/value, ':', '_')" />GDNode.process(objectArray, intArray, null, null)

                    }
                    </xsl:if>

    </xsl:template>

    <xsl:template name="extensionMapping" >
        <xsl:param name="extensionNameAndExtensionFunction" />
        <xsl:param name="objectOverride" />

                            <xsl:text>&#10;</xsl:text>
                            //extensionMapping - <xsl:value-of select="$extensionNameAndExtensionFunction" />
        <xsl:choose>
                            <xsl:when test="$extensionNameAndExtensionFunction = 'SnapToGrid::SnapObjectToVirtualGrid'" >
                                <xsl:if test="string-length($objectOverride) > 0" >
                            objectArray[1] = <xsl:value-of select="$objectOverride" />
                                </xsl:if>
                                <xsl:if test="string-length($objectOverride) = 0" >
                            objectArray[1] = gameLayer
                                </xsl:if>

                            intArray[2] = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                            intArray[3] = <xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                            intArray[4] = <xsl:for-each select="parameters" ><xsl:if test="position() = 5" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                            intArray[5] = <xsl:for-each select="parameters" ><xsl:if test="position() = 6" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                            //extensionMapping - //<xsl:value-of select="$extensionNameAndExtensionFunction" /> - NOT_IMPLEMENTED
                            </xsl:otherwise>

        </xsl:choose>

    </xsl:template>

</xsl:stylesheet>
