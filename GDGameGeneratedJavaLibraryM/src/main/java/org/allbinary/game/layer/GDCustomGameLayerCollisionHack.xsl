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

    <xsl:template name="mapCollisionMaskHack" >
        <xsl:for-each select="events" >
            <xsl:variable name="foundCollisionNP" >
            <xsl:for-each select="conditions" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
            </xsl:variable>
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select="actions" >
            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>
            </xsl:if>
            <xsl:call-template name="mapCollisionMaskHack" />
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="hasCollisionListForLayout" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="conditions" >
            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select=".." >
                <xsl:for-each select="actions" >
                    found
                </xsl:for-each>
                <xsl:for-each select="events" >
                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >
                        <xsl:for-each select="conditions" >
                        found
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="not(//objectsGroups/name/text() = $foundCollisionNP)" >
                        found
                    </xsl:if>
                </xsl:for-each>

                </xsl:for-each>
            </xsl:if>

            </xsl:for-each>
            
            <xsl:call-template name="hasCollisionListForLayout" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
            
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="addCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="conditions" >
            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select=".." >
                //Condition - <xsl:value-of select="$foundCollisionNP" /> with <xsl:value-of select="$foundCollisionNP2" />
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //name=<xsl:value-of select="$name" /> <xsl:if test="string-length($name) = 0" >(Empty Name)</xsl:if>
                    <xsl:if test="not(string-length($name) > 0 or $typeValue = 'Create' or $typeValue = 'PlaySoundOnChannel')" >
                        //Currently Skipped
                        ...
                    </xsl:if>
                    <xsl:if test="$typeValue = 'Create'" >
                        //Currently not Skipped
                    //Using ObjectsGroups - <xsl:value-of select="$foundCollisionNP" /> - Create
                    if(<xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $foundCollisionNP" >
                                <xsl:for-each select="objects" >this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME<xsl:if test="position() != last()" > || <xsl:text>&#10;</xsl:text>                                </xsl:if>
                            </xsl:for-each></xsl:if></xsl:for-each>) {
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                    }
                    </xsl:if>
                    <xsl:if test="string-length($name) > 0" >
                    <xsl:if test="//objectsGroups/name/text() = $name" >
                    //Using ObjectsGroups - <xsl:value-of select="$foundCollisionNP" />
                    if(<xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $name" >
                                <xsl:for-each select="objects" >this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME<xsl:if test="position() != last()" > || <xsl:text>&#10;</xsl:text>                                </xsl:if>
                            </xsl:for-each></xsl:if></xsl:for-each>) {
                    </xsl:if>
                    <xsl:if test="not(//objectsGroups/name/text() = $name)" >
                    <xsl:if test="//objects/name/text() = $name" >
                    //Using GDObject param
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                    </xsl:if>
                    <xsl:if test="not(//objects/name/text() = $name)" >
                    
                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >
                    //Using CollisionNP - ObjectsGroups - <xsl:value-of select="$foundCollisionNP" />
                    if(<xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $foundCollisionNP" >
                                <xsl:for-each select="objects" >this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME<xsl:if test="position() != last()" > || <xsl:text>&#10;</xsl:text>                                </xsl:if>
                            </xsl:for-each></xsl:if></xsl:for-each>) {
                    </xsl:if>
                    <xsl:if test="not(//objectsGroups/name/text() = $foundCollisionNP)" >
                    <xsl:if test="//objects/name/text() = $foundCollisionNP" >
                    //Using CollisionNP - <xsl:value-of select="$foundCollisionNP" />
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                    </xsl:if>
                    </xsl:if>

                    </xsl:if>
                    </xsl:if>
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                    }
                    </xsl:if>
                </xsl:for-each>
                <xsl:for-each select="events" >
                    
                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

                    <xsl:if test="type != 'BuiltinCommonInstructions::Comment'" >

                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >
                        <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />

                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //name=<xsl:value-of select="$name" />
                        <xsl:if test="//objectsGroups/name/text() = $name" >
                    //Using ObjectsGroups - <xsl:value-of select="$foundCollisionNP" /> - //Using child condition instead of CollisionNP - condition name was an objectsGroups
                            if(<xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $foundCollisionNP" >
                                <xsl:for-each select="objects" >this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME<xsl:if test="position() != last()" > || <xsl:text>&#10;</xsl:text>                                </xsl:if>
                            </xsl:for-each></xsl:if></xsl:for-each>) {
                        </xsl:if>
                        <xsl:if test="string-length($name) > 0" >
                        <xsl:if test="not(//objectsGroups/name/text() = $name)" >
<!--                    //Using child condition instead of CollisionNP - condition name was not an objectsGroups-->
                    //Using CollisionNP - condition name was not an objectsGroups
                    //if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                    if(<xsl:for-each select="//objectsGroups" >
                            <xsl:if test="name = $foundCollisionNP" >
                            <xsl:for-each select="objects" >this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME<xsl:if test="position() != last()" > || <xsl:text>&#10;</xsl:text>                                </xsl:if>
                            </xsl:for-each></xsl:if></xsl:for-each>) {

                        </xsl:if>
                        </xsl:if>
                        </xsl:for-each>
                        <xsl:variable name="name" ><xsl:for-each select="conditions" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                        <xsl:if test="string-length($name) > 0" >
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                        <xsl:if test="conditions" >
                    }
                        </xsl:if>
                        </xsl:if>
                        
                        <xsl:if test="not(conditions)" >
                    //Skipping event without condition or events
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="not(//objectsGroups/name/text() = $foundCollisionNP)" >
                    //Using CollisionNP 2
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                    }
                    </xsl:if>
                    
                    </xsl:if>
                </xsl:for-each>

                </xsl:for-each>
            </xsl:if>

            </xsl:for-each>
            
            <xsl:call-template name="addCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
            
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="hasWhileCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="whileConditions" >
            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select=".." >
                <xsl:for-each select="actions" >
                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >found</xsl:if>
                </xsl:for-each>
                <xsl:for-each select="events" >
                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >found</xsl:if>
                </xsl:for-each>
                
                </xsl:for-each>
            </xsl:if>
            
            </xsl:for-each>
            
            <xsl:call-template name="hasWhileCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="addWhileCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="whileConditions" >
            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select=".." >
                //WhileCondition - <xsl:value-of select="$foundCollisionNP" /> with <xsl:value-of select="$foundCollisionNP2" />
                <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >
                    //Using ObjectsGroups - <xsl:value-of select="$foundCollisionNP" /> - //Using action instead of CollisionNP
                    //if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                    if(<xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $foundCollisionNP" >
                                <xsl:for-each select="objects" >this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME<xsl:if test="position() != last()" > || <xsl:text>&#10;</xsl:text>                                </xsl:if>
                            </xsl:for-each></xsl:if></xsl:for-each>) {
                    </xsl:if>
                    <xsl:if test="not(//objectsGroups/name/text() = $foundCollisionNP)" >
                    //Using CollisionNP 3
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                    </xsl:if>
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                    }
                </xsl:for-each>
                <xsl:for-each select="events" >
                    
                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >
                        <xsl:for-each select="conditions" >
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //Using child condition instead of CollisionNP 2
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                        </xsl:for-each>
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                        <xsl:if test="conditions" >
                    }
                        </xsl:if>
                        <xsl:if test="not(conditions)" >
                    //Skipping event without condition or events 2
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="not(//objectsGroups/name/text() = $foundCollisionNP)" >
                    //Using CollisionNP 4
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                    }
                    </xsl:if>
                </xsl:for-each>
                
                </xsl:for-each>
            </xsl:if>
            
            </xsl:for-each>
            
            <xsl:call-template name="addWhileCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="hasSubInstructionsCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="conditions" >
                <xsl:for-each select="subInstructions" >

            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select=".." >
                    <xsl:for-each select=".." >
                        
                <xsl:for-each select="actions" >
                    found
                </xsl:for-each>
                <xsl:for-each select="events" >
                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >
                        <xsl:for-each select="conditions" >
                            found
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="not(//objectsGroups/name/text() = $foundCollisionNP)" >
                        found
                    </xsl:if>
                </xsl:for-each>
                
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:if>
            
                </xsl:for-each>
            </xsl:for-each>
            
            <xsl:call-template name="hasSubInstructionsCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>

        </xsl:for-each>
    </xsl:template>

    <xsl:template name="addSubInstructionsCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="conditions" >
                <xsl:for-each select="subInstructions" >

            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                //SubInstructions - <xsl:value-of select="$foundCollisionNP" /> with <xsl:value-of select="$foundCollisionNP2" />
                <xsl:for-each select=".." >
                    <xsl:for-each select=".." >
                        
                <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >
                    //Using action instead of CollisionNP 2
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                    </xsl:if>
                    <xsl:if test="not(//objectsGroups/name/text() = $foundCollisionNP)" >
                    //Using CollisionNP 5
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                    </xsl:if>
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                    }
                </xsl:for-each>
                <xsl:for-each select="events" >
                    
                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                
                    <xsl:if test="//objectsGroups/name/text() = $foundCollisionNP" >
                        <xsl:for-each select="conditions" >
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //Using child condition instead of CollisionNP 3
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                        </xsl:for-each>
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                        <xsl:if test="conditions" >
                    }
                        </xsl:if>
                        <xsl:if test="not(conditions)" >
                    //Skipping event without condition or events 3
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="not(//objectsGroups/name/text() = $foundCollisionNP)" >
                    //Using CollisionNP 6
                    if(this.gdObject.name == <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$foundCollisionNP" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                        this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                    }
                    </xsl:if>
                </xsl:for-each>
                
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:if>
            
                </xsl:for-each>
            </xsl:for-each>
            
            <xsl:call-template name="addSubInstructionsCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="createCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="conditions" >
            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select=".." >

                //Conditions - <xsl:value-of select="$foundCollisionNP" /> with <xsl:value-of select="$foundCollisionNP2" />
                <xsl:if test="actions" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name2" ><xsl:value-of select="$name" />,</xsl:variable>
                    //action under condition
                    private final BasicArrayList <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList = new BasicArrayList();
                </xsl:if>
                <xsl:if test="not(actions)" >
                <xsl:if test="events" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name2" ><xsl:value-of select="$name" />,</xsl:variable>
                    //event under condition
                    private final BasicArrayList <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList = new BasicArrayList();
                </xsl:if>
                </xsl:if>
                
                </xsl:for-each>
            </xsl:if>
            
            </xsl:for-each>
            
            <xsl:call-template name="createCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="createWhileCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="whileConditions" >
            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>

            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select=".." >
                //WhileConditions - <xsl:value-of select="$foundCollisionNP" /> with <xsl:value-of select="$foundCollisionNP2" />
                <xsl:if test="actions" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //action under whileCondition
                    private final BasicArrayList <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList = new BasicArrayList();
                </xsl:if>
                <xsl:if test="not(actions)" >
                <xsl:if test="events" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //event under whileCondition
                    private final BasicArrayList <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList = new BasicArrayList();
                </xsl:if>
                </xsl:if>
                
                </xsl:for-each>
            </xsl:if>
            
            </xsl:for-each>
            
            <xsl:call-template name="createWhileCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="createSubInstructionsCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="conditions" >
                <xsl:for-each select="subInstructions" >
                    <xsl:variable name="foundCollisionNP" >
                        <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:variable>
                    <xsl:variable name="foundCollisionNP2" >
                        <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 2" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:variable>

                    <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    <xsl:if test="string-length($foundCollisionNP) > 0" >
                        //SubInstructions - <xsl:value-of select="$foundCollisionNP" /> with <xsl:value-of select="$foundCollisionNP2" />
                        <xsl:if test="../../actions" >
                            <xsl:variable name="name" >
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:variable>
                            //action under whileCondition
                            private final BasicArrayList <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList = new BasicArrayList();
                        </xsl:if>
                        <xsl:if test="not(../../actions)" >
                            <xsl:if test="../../events" >
                                <xsl:variable name="name" >
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:value-of select="text()" />
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                //event under whileCondition
                                private final BasicArrayList <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList = new BasicArrayList();
                            </xsl:if>
                        </xsl:if>
                    </xsl:if>
                    
                </xsl:for-each>
            </xsl:for-each>

            <xsl:call-template name="createSubInstructionsCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="processCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >
            <xsl:for-each select="conditions" >
                
            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select=".." >
                
                <xsl:if test="actions" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
    <xsl:variable name="text" ><xsl:value-of select="$foundCollisionNP2" /></xsl:variable>
    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>
    //<xsl:value-of select="type/value" /> - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
    public void <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />ProcessGDCollision() throws Exception {
        final int size = this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.size();
//        if(this.gdObject.name.compareTo(B) == 0) {
//            logUtil.put(new StringMaker().append(this.toString()).append(CommonSeps.getInstance().COLON).append(size).toString(), this, P);
//        }
        GDNode node;
        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            node = (GDNode) this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.get(index);
            node.processGD(this, gameGlobals.tempGameLayerArray[0], null);
        }
    }
                </xsl:if>
                <xsl:if test="not(actions)" >
                <xsl:if test="events" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
    <xsl:variable name="text" ><xsl:value-of select="$foundCollisionNP2" /></xsl:variable>
    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>
    //<xsl:value-of select="type" /> - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
    public void <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />ProcessGDCollision() throws Exception {
        final int size = this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.size();
//        if(this.gdObject.name.compareTo(B) == 0) {
//            logUtil.put(new StringMaker().append(this.toString()).append(CommonSeps.getInstance().COLON).append(size).toString(), this, P);
//        }
        GDNode node;
        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            node = (GDNode) this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.get(index);
            node.processGD(this, gameGlobals.tempGameLayerArray[0], null);
        }
    }
                </xsl:if>
                </xsl:if>

                </xsl:for-each>
            </xsl:if>
            
            </xsl:for-each>

            <xsl:call-template name="processCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="processWhileCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >

            <xsl:for-each select="whileConditions" >

            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
                        
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select=".." >

                <xsl:if test="actions" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />                    
    <xsl:variable name="text" ><xsl:value-of select="$foundCollisionNP2" /></xsl:variable>
    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>
    //<xsl:value-of select="type/value" /> - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
    public void <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />ProcessGDCollision() throws Exception {
        final int size = this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.size();
//        if(this.gdObject.name.compareTo(B) == 0) {
//            logUtil.put(new StringMaker().append(this.toString()).append(CommonSeps.getInstance().COLON).append(size).toString(), this, P);
//        }
        GDNode node;
        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            node = (GDNode) this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.get(index);
            node.processGD(this, gameGlobals.tempGameLayerArray[0], null);
        }
    }
                </xsl:if>
                <xsl:if test="not(actions)" >
                <xsl:if test="events" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
    <xsl:variable name="text" ><xsl:value-of select="$foundCollisionNP2" /></xsl:variable>
    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>
    //<xsl:value-of select="type/value" /> - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
    public void <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />ProcessGDCollision() throws Exception {
        final int size = this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.size();
//        if(this.gdObject.name.compareTo(B) == 0) {
//            logUtil.put(new StringMaker().append(this.toString()).append(CommonSeps.getInstance().COLON).append(size).toString(), this, P);
//        }
        GDNode node;
        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            node = (GDNode) this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.get(index);
            node.processGD(this, gameGlobals.tempGameLayerArray[0], null);
        }
    }
                </xsl:if>
                </xsl:if>

                </xsl:for-each>
            </xsl:if>
            
            </xsl:for-each>

            <xsl:call-template name="processWhileCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="processSubInstructionsCollisionList" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="events" >

            <xsl:for-each select="conditions" >
                <xsl:for-each select="subInstructions" >

            <xsl:variable name="foundCollisionNP" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="foundCollisionNP2" >
                <xsl:if test="type/value = 'CollisionNP' or type/value = 'Collision'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

            <xsl:if test="string-length($foundCollisionNP) > 0" >
                
                <xsl:for-each select=".." >
                    <xsl:for-each select=".." >
                
                <xsl:if test="actions" >
                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />                    
    <xsl:variable name="text" ><xsl:value-of select="$foundCollisionNP2" /></xsl:variable>
    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>
    //<xsl:value-of select="type/value" /> - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
    public void <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />ProcessGDCollision() throws Exception {
        final int size = this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.size();
//        if(this.gdObject.name.compareTo(B) == 0) {
//            logUtil.put(new StringMaker().append(this.toString()).append(CommonSeps.getInstance().COLON).append(size).toString(), this, P);
//        }
        GDNode node;
        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            node = (GDNode) this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.get(index);
            node.processGD(this, gameGlobals.tempGameLayerArray[0], null);
        }
    }
                </xsl:if>
                <xsl:if test="not(actions)" >
                <xsl:if test="events" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
    <xsl:variable name="text" ><xsl:value-of select="$foundCollisionNP2" /></xsl:variable>
    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>
    //<xsl:value-of select="type/value" /> - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
    public void <xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />ProcessGDCollision() throws Exception {
        final int size = this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" /><xsl:value-of select="$nodeId" />CollisionList.size();
//        if(this.gdObject.name.compareTo(B) == 0) {
//            logUtil.put(new StringMaker().append(this.toString()).append(CommonSeps.getInstance().COLON).append(size).toString(), this, P);
//        }
        GDNode node;
        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            node = (GDNode) this.<xsl:value-of select="$foundCollisionNP" /><xsl:value-of select="$foundCollisionNP2" />CollisionList.get(index);
            node.processGD(this, gameGlobals.tempGameLayerArray[0], null);
        }
    }
                </xsl:if>
                </xsl:if>

                     </xsl:for-each>
                </xsl:for-each>
            </xsl:if>
            
                </xsl:for-each>
            </xsl:for-each>

            <xsl:call-template name="processSubInstructionsCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
