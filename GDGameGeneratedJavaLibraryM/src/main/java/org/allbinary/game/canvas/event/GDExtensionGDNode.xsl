<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template name="extensionGDNode" >
        <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
                            //extensionGDNode
                            //<xsl:value-of select="name" /> - //version=<xsl:value-of select="version" /> //eventsFunctionsExtensions - extensionGDNode
                            //fullName=<xsl:value-of select="fullName" />
                            //shortDescription=<xsl:value-of select="shortDescription" />
                            //author=<xsl:value-of select="author" />
                            //category=<xsl:value-of select="category" />
                            //extensionNamespace=<xsl:value-of select="extensionNamespace" />
                            //gdevelopVersion=<xsl:value-of select="gdevelopVersion" />
                            //helpPath=<xsl:value-of select="helpPath" />
                            //iconUrl=Use for Editor only
                            //previewIconUrl=Use for Editor only
                            //tags=Use for Editor only
                            //authorIds=Use for Editor only
                            //dependencies=Use for Editor only
                            
                            <xsl:for-each select="eventsFunctions" >
                                <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                            //name=<xsl:value-of select="name" /> - //eventsFunctions
                            //fullName=<xsl:value-of select="fullName" />
                            //functionType=<xsl:value-of select="functionType" />
                            /*description=<xsl:value-of select="description" />*/
                            /*sentence=<xsl:value-of select="sentence" />*/

                        <xsl:for-each select="events" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            <xsl:text>&#10;</xsl:text><xsl:text>
                            </xsl:text><xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode = new GDNode(-<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                            
                                //private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=-1 type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                                <xsl:text>&#10;</xsl:text>

                                @Override
                                public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                                                        
                                    //logUtil.put(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                <xsl:for-each select="../objectGroups" >
                            //objectGroups
                </xsl:for-each>
                                                                        
                                    //Map from action params to extension params
                                    
                <xsl:for-each select="../parameters" >
                            //name=<xsl:value-of select="name" /> - //parameters
                            //description=<xsl:value-of select="description" />
                            //type=<xsl:value-of select="type" />
                            
                </xsl:for-each>

                    <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        if(NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />.process(objectArray, intArray, longArray, floatArray)) {
                    </xsl:for-each>

                        <xsl:for-each select="actions" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />.process(objectArray, intArray, longArray, floatArray);
                        </xsl:for-each>
                        <xsl:for-each select="events" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />.process(objectArray, intArray, longArray, floatArray);
                            </xsl:if>
                        </xsl:for-each>
                    
                    <xsl:for-each select="conditions" >
                        }
                    </xsl:for-each>

                                    return true;
                                }

                            };
                            
                            </xsl:if>
                        </xsl:for-each>
                        
                    </xsl:for-each>
                            
                    <xsl:for-each select="eventsBasedBehaviors" >
                                //eventsBasedBehaviors
                    </xsl:for-each>
                    <xsl:for-each select="eventsBasedObjects" >
                                //eventsBasedObjects
                    </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
