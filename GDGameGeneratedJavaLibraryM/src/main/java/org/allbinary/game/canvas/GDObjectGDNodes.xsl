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
    
    <xsl:template name="objectGDObjectGDNodes" >
        <xsl:param name="caller" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="actionTypesAsString" />
        <xsl:param name="parentEventType" />

        //caller=<xsl:value-of select="$caller" /> - //objectGDObjectGNodes - layoutIndex=<xsl:value-of select="$layoutIndex" /> parametersAsString=<xsl:value-of select="$parametersAsString" />
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >

                    <xsl:variable name="params" >
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                            <xsl:if test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TileMap::CollisionMask'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:variable>

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>
                        <xsl:variable name="colonName" >:<xsl:value-of select="name" />,</xsl:variable>
                        <xsl:variable name="before" select="substring-before(substring-before($parametersAsString, $name), $colonName)" />
                        <xsl:variable name="actionNodeIdFromRelatedParams" ><xsl:call-template name="after-lastIndexOf" ><xsl:with-param name="string" select="$before" /><xsl:with-param name="char" select="','" /></xsl:call-template></xsl:variable>
                        <xsl:variable name="beforeColon" select="substring-before($parametersAsString, ':')" />
                        <xsl:variable name="actionNodeId" ><xsl:if test="$actionNodeIdFromRelatedParams != ''" ><xsl:value-of select="$actionNodeIdFromRelatedParams" /></xsl:if><xsl:if test="$actionNodeIdFromRelatedParams = ''" ><xsl:value-of select="$beforeColon" /></xsl:if></xsl:variable>
                        <xsl:if test="string-length($parametersAsString) > 0 or $actionNodeId != ''" >//objectGDObjectGDNodes - <xsl:if test="string-length($parametersAsString) > 0" >//name=<xsl:value-of select="name" /> - //typeValue=<xsl:value-of select="$typeValue" /> - //before=<xsl:value-of select="$before" /> - //actionNodeIdFromRelatedParams=<xsl:value-of select="$actionNodeIdFromRelatedParams" /></xsl:if> <xsl:if test="$actionNodeId != ''" >//actionNodeId=<xsl:value-of select="$actionNodeId" /></xsl:if></xsl:if>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        //caller=<xsl:value-of select="$caller" /> - //objectGDObjectAtIndex - //Objects - //GDNode - //collide - //Sprite - //<xsl:value-of select="$name" />
                        if(gameGlobals.nodeArray[gameGlobals.PARAM_NODE_<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        gameGlobals.nodeArray[gameGlobals.PARAM_NODE_<xsl:value-of select="$actionNodeId" />] = new GDNode(<xsl:value-of select="$actionNodeId" />) {

                            <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />

                            private final String ACTION_PARAMETER_ID_AS_STRING_<xsl:value-of select="$actionNodeId" /> = "Parameter - <xsl:value-of select="$actionNodeId" />";
                            <xsl:text>&#10;</xsl:text>
                            
                            //caller=<xsl:value-of select="$caller" /> - //objectGDObjectAtIndex - //Objects - //GDNode - //collide - //Sprite - //<xsl:value-of select="$name" />
                            @Override
                            public boolean process() throws Exception {
                                super.processStats();

                                //0
                                if(true) throw new RuntimeException();
                                final TempGameLayerUtil tempGameLayerUtil = TempGameLayerUtil.getInstance();
                                tempGameLayerUtil.clear();
                                this.processM(tempGameLayerUtil.gameLayerArray);
                                tempGameLayerUtil.clear2();
                                
                                return true;
                            }

                            private final String ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> = "Collision: " + ACTION_PARAMETER_ID_AS_STRING_<xsl:value-of select="$actionNodeId" />;
                            private final String ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE = ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> + objectStrings.CALLING_GDNODE;

                        };

                            </xsl:if>
                            
                            <xsl:if test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
                        //caller=<xsl:value-of select="$caller" /> - //objectGDObjectAtIndex - //Objects - //GDNode - //collide - //ParticleSystem::ParticleEmitter - //<xsl:value-of select="$name" />
                        if(gameGlobals.nodeArray[gameGlobals.PARAM_NODE_<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        gameGlobals.nodeArray[gameGlobals.PARAM_NODE_<xsl:value-of select="$actionNodeId" />] = new GDNode(<xsl:value-of select="$actionNodeId" />) {

                            <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />

                            private final String ACTION_PARAMETER_ID_AS_STRING_<xsl:value-of select="$actionNodeId" /> = "Parameter - <xsl:value-of select="$actionNodeId" />";
                            <xsl:text>&#10;</xsl:text>
                            
                            //caller=<xsl:value-of select="$caller" /> - //objectGDObjectAtIndex - //Objects - //GDNode - //collide - //ParticleSystem::ParticleEmitter - //<xsl:value-of select="$name" />
                            @Override
                            public boolean process() throws Exception {
                                super.processStats();

                                //1
                                if(true) throw new RuntimeException();
                                final TempGameLayerUtil tempGameLayerUtil = TempGameLayerUtil.getInstance();
                                tempGameLayerUtil.clear();
                                this.processM(tempGameLayerUtil.gameLayerArray);
                                tempGameLayerUtil.clear2();
                                
                                return true;
                            }

                            private final String ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> = "Collision: " + ACTION_PARAMETER_ID_AS_STRING_<xsl:value-of select="$actionNodeId" />;
                            private final String ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE = ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> + objectStrings.CALLING_GDNODE;

                        };

                            </xsl:if>                            

                            <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap'" >
                        //caller=<xsl:value-of select="$caller" /> - //objectGDObjectAtIndex - //Objects - //GDNode - //collide - //TileMap::TileMap - //<xsl:value-of select="$name" />
                        if(gameGlobals.nodeArray[gameGlobals.PARAM_NODE_<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        gameGlobals.nodeArray[gameGlobals.PARAM_NODE_<xsl:value-of select="$actionNodeId" />] = new GDNode(<xsl:value-of select="$actionNodeId" />) {

                            <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />

                            private final String ACTION_PARAMETER_ID_AS_STRING_<xsl:value-of select="$actionNodeId" /> = "Parameter - <xsl:value-of select="$actionNodeId" />";
                            <xsl:text>&#10;</xsl:text>
                            
                            //caller=<xsl:value-of select="$caller" /> - //objectGDObjectAtIndex - //Objects - //GDNode - //collide - //TileMap::TileMap - //<xsl:value-of select="$name" />
                            @Override
                            public boolean process() throws Exception {
                                super.processStats();
                            
                                //2
                                if(true) throw new RuntimeException();
                                final TempGameLayerUtil tempGameLayerUtil = TempGameLayerUtil.getInstance();
                                tempGameLayerUtil.clear();
                                this.processM(tempGameLayerUtil.gameLayerArray);
                                tempGameLayerUtil.clear2();
                                
                                return true;
                            }

                            private final String ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> = "Collision: " + ACTION_PARAMETER_ID_AS_STRING_<xsl:value-of select="$actionNodeId" />;
                            private final String ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE = ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> + objectStrings.CALLING_GDNODE;

                        };

                            </xsl:if>
                            
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        //caller=<xsl:value-of select="$caller" /> - //objectGDObjectAtIndex - //Objects - //GDNode - //collide - //TextObject::Text - //<xsl:value-of select="$name" />
                        if(gameGlobals.nodeArray[gameGlobals.PARAM_NODE_<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        gameGlobals.nodeArray[gameGlobals.PARAM_NODE_<xsl:value-of select="$actionNodeId" />] = new GDNode(<xsl:value-of select="$actionNodeId" />) {

                            <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />

                            private final String ACTION_ID_AS_STRING_<xsl:value-of select="$actionNodeId" /> = "Parameter - <xsl:value-of select="$actionNodeId" />";
                            <xsl:text>&#10;</xsl:text>
                        
                            //caller=<xsl:value-of select="$caller" /> - //objectGDObjectAtIndex - //Objects - //GDNode - //collide - //TextObject::Text - //<xsl:value-of select="$name" />
                            @Override
                            public boolean process() throws Exception {
                                super.processStats();

                                //3
                                if(true) throw new RuntimeException();
                                final TempGameLayerUtil tempGameLayerUtil = TempGameLayerUtil.getInstance();
                                tempGameLayerUtil.clear();
                                this.processM(tempGameLayerUtil.gameLayerArray);
                                tempGameLayerUtil.clear2();
                                
                                return true;
                            }

                            private final String ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> = "Collision: " + ACTION_ID_AS_STRING_<xsl:value-of select="$actionNodeId" />;
                            private final String ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE = ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> + objectStrings.CALLING_GDNODE;

                        };

                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
