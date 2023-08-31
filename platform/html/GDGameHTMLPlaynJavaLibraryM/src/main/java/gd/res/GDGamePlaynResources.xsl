<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionZoomCameraGlobal.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">
        
package gd.res;

import com.google.gwt.core.shared.GWT;
import com.google.gwt.resources.client.ClientBundle;
import com.google.gwt.resources.client.ClientBundle.Source;
import com.google.gwt.resources.client.TextResource;

        <xsl:for-each select="layouts" >
            <xsl:variable name="index" select="position() - 1" />
            <xsl:if test="number($index) = <GD_CURRENT_INDEX>" >

public interface GD<xsl:value-of select="$index" />GamePlaynResources extends ClientBundle {
  public static final GD<xsl:value-of select="$index" />GamePlaynResources INSTANCE =  GWT.create(GD<xsl:value-of select="$index" />GamePlaynResources.class);

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
                <xsl:variable name="stringValue" select="string" />
                //TileMap::TileMap - <xsl:value-of select="name" />

  final String[] NAMES = {
                <xsl:if test="content" >
                    //TileMap::TileMap:content
                    <xsl:variable name="jsonWithExtension" select="content/tilemapJsonFile" />
                    "<xsl:value-of select="$jsonWithExtension" />",
                    <xsl:variable name="tileSetJSONWithExtension" select="content/tilesetJsonFile" />
                    "<xsl:value-of select="$tileSetJSONWithExtension" />",
                    <xsl:for-each select="content/tilesetJsonFiles" >
                    "<xsl:value-of select="text()" />",
                    </xsl:for-each>
                </xsl:if>
  };

<xsl:if test="content" >
    <xsl:variable name="jsonWithExtension" select="content/tilemapJsonFile" />
    <xsl:variable name="json" select="substring-before($jsonWithExtension, '.')" />
  @Source(value = { "<xsl:value-of select="$jsonWithExtension" />"})
  public TextResource <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$json" /></xsl:with-param></xsl:call-template>();
</xsl:if>

<xsl:if test="content" >
    <xsl:variable name="tileSetJSONWithExtension" select="content/tilesetJsonFile" />
    <xsl:variable name="json" select="substring-before($tileSetJSONWithExtension, '.')" />
  @Source(value = { "<xsl:value-of select="$tileSetJSONWithExtension" />"})
  public TextResource <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$json" /></xsl:with-param></xsl:call-template>();
</xsl:if>

<xsl:if test="content" >
    <xsl:for-each select="content/tilesetJsonFiles" >
    <xsl:variable name="json" select="substring-before(text(), '.')" />
  @Source(value = { "<xsl:value-of select="text()" />"})
  public TextResource <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$json" /></xsl:with-param></xsl:call-template>();
    </xsl:for-each>
</xsl:if>           

            </xsl:if>

        </xsl:for-each>        
  
}                
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
