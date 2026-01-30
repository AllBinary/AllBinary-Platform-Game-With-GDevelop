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
    
    <xsl:template name="eventsCreateAssignGDObjectGDNodesOtherEvent" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
         
        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

<!--       
            <xsl:variable name="actionParametersAsString0" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>
            <xsl:variable name="actionParametersAsString" ><xsl:value-of select="translate(translate($actionParametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
-->

            <xsl:variable name="thisNodeArray" >
                <xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:if></xsl:for-each>
            </xsl:variable>

            <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />

            <xsl:variable name="foundOtherCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Always' or type/value = 'DepartScene' or type/value = 'ObjectVariableChildCount' or type/value = 'NumberObjectVariable' or type/value = 'VarScene' or type/value = 'NbObjet' or type/value = 'BooleanObjectVariable' or type/value = 'SourisSurObjet' or type/value = 'BooleanVariable'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="foundVarSceneCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'VarScene'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="foundLinkEvent" ><xsl:for-each select="events" ><xsl:if test="type = 'BuiltinCommonInstructions::Link'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="foundTimerCondition" >
                <xsl:for-each select="conditions" >
                    <xsl:if test="type/value = 'Timer'" >found</xsl:if>
                </xsl:for-each>
            </xsl:variable>

            //foundOtherCondition=<xsl:value-of select="$foundOtherCondition" />
            //foundVarSceneCondition=<xsl:value-of select="$foundVarSceneCondition" />
            //foundTimerCondition=<xsl:value-of select="$foundTimerCondition" />
            //foundLinkEvent=<xsl:value-of select="$foundLinkEvent" />

            <xsl:variable name="selectedNodeId" select="number(substring(generate-id(), 2) - 65536)" />
            <xsl:variable name="lastDigit" ><xsl:value-of select="substring($selectedNodeId, string-length($selectedNodeId))" /></xsl:variable>
            <xsl:variable name="lastDigit2" ><xsl:if test="4 >= $lastDigit" >0</xsl:if><xsl:if test="$lastDigit > 4" >1</xsl:if></xsl:variable>

            <!-- other events - START -->
            <xsl:choose>
            <xsl:when test="type = 'BuiltinCommonInstructions::Comment'" >
            //Do not create GDNode for comment event type
            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::Link'" >
            //Do not create GDNode for link - The target GDNode is called instead.
            </xsl:when>
            
            <xsl:when test="type = 'BuiltinCommonInstructions::JsCode'" >
                
                <xsl:call-template name="javascriptCodeEventGDNode" >
                    <xsl:param name="totalRecursions" ><xsl:value-of select="$totalRecursions" /></xsl:param>
                </xsl:call-template>

            </xsl:when>
            
            <xsl:when test="type = 'BuiltinCommonInstructions::ForEach'" >

                <xsl:variable name="object" ><xsl:value-of select="object" /></xsl:variable>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
            if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }

            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = org.allbinary.game.canvas.node.builtin.GD<xsl:value-of select="$layoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes.getInstance().NODE_<xsl:value-of select="$selectedNodeId" />;

            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::Standard' or 
                          type = 'BuiltinCommonInstructions::ForEachChildVariable' or 
                          type = 'BuiltinCommonInstructions::While' or 
                          type = 'BuiltinCommonInstructions::Group' or 
                          type = 'BuiltinCommonInstructions::Repeat' or 
                          type = 'BuiltinExternalLayouts::CreateObjectsFromExternalLayout'" >

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
            if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = org.allbinary.game.canvas.node.builtin.GD<xsl:value-of select="$layoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes.getInstance().NODE_<xsl:value-of select="$selectedNodeId" />;

            </xsl:when>

            <xsl:when test="type = 'BuiltinAsync::Async'" >
            //<xsl:value-of select="type" /> NOT_IMPLEMENTED
            </xsl:when>
            <xsl:otherwise>
            //<xsl:value-of select="type" /> NOT_IMPLEMENTED2
            </xsl:otherwise>
            </xsl:choose>
            <!-- other events - END -->

            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesOtherEvent" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="thisNodeIndex" >
                    <xsl:value-of select="$thisNodeIndex" />
                </xsl:with-param>
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="instancesAsString" >
                    <xsl:value-of select="$instancesAsString" />
                </xsl:with-param>
                <xsl:with-param name="objectsGroupsAsString" >
                    <xsl:value-of select="$objectsGroupsAsString" />
                </xsl:with-param>
                <xsl:with-param name="objectsAsString" >
                    <xsl:value-of select="$objectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="createdObjectsAsString" >
                    <xsl:value-of select="$createdObjectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>

            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
