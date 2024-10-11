/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 * 
 */
package org.allbinary.gdevelop.loader;


import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.PositionStrings;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDCustomCollisionMaskImageGenerator extends GDJSONGeneratorBase {
    
    //private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final PositionStrings positionStrings = PositionStrings.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    private final String UPDATE_SPRITE = "Update Sprite: ";
    private final String LOAD_IMAGE = "Load Image: ";
    private final String LOAD_SPRITE = "Load Sprite: ";
    private final String ADJUSTING_HEIGHT = "Adjusting Height from Sprite: ";
    private final String SKIPPING_IMAGE = "Skipping Image: ";
    
    public void process() throws Exception {
        final JSONObject gameAsConfigurationJSONObject = GDJSONPersistence.getInstance().load();
        this.process(gameAsConfigurationJSONObject);
        
        GDJSONPersistence.getInstance().save(gameAsConfigurationJSONObject);
    }

    public void processLayout(final JSONObject jsonObject) throws Exception {
        this.processObjects(jsonObject);
    }
    
    private void processObjects(final JSONObject layoutJSONObject) throws Exception {

        final JSONArray jsonArray = layoutJSONObject.getJSONArray(this.gdProjectStrings.OBJECTS);

        System.out.println("Object Total: " + jsonArray.length());
        
        final int size = jsonArray.length();
        JSONObject jsonObject;
        String type;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            type = jsonObject.getString(this.gdProjectStrings.TYPE);
            //System.out.println("Type: " + type);
            if(type.compareTo(this.gdProjectStrings.SPRITE) == 0) {
                System.out.println(UPDATE_SPRITE + jsonObject.getString(this.gdProjectStrings.NAME));
                this.processSprite(jsonObject);
            } 
//            else {
//                System.out.println("Other Type: " + type);
//            }
        }

//        for(int index = 0; index < jsonArray.length(); index++) {
//            jsonObject = jsonArray.getJSONObject(index);
//            value = jsonObject.getString(this.gdProjectStrings.NAME);
//            System.out.println(value);
//        }
    }
    
    public void processSprite(final JSONObject jsonObject) throws Exception {
        final JSONArray jsonArray = jsonObject.getJSONArray(this.gdProjectStrings.ANIMATIONS);
        this.processAnimations(jsonArray);            
    }    

    public void processAnimations(final JSONArray jsonArray) throws Exception {
        final int size = jsonArray.length();
        JSONObject jsonObject;
        JSONArray animationsJSONArray;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            animationsJSONArray = jsonObject.getJSONArray(this.gdProjectStrings.DIRECTIONS);
            this.processDirections(animationsJSONArray);
        }
    }
    
    public void processDirections(final JSONArray jsonArray) throws Exception {
        final int size = jsonArray.length();
        JSONObject jsonObject;
        JSONArray spritesJSONArray;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            spritesJSONArray = jsonObject.getJSONArray(this.gdProjectStrings.SPRITES);
            this.processSprites(spritesJSONArray);
        }
        
        //this.gdProjectStrings.CUSTOM_COLLISION_MASK
    }

    public void processSprites(final JSONArray jsonArray) throws Exception {
        final int size = jsonArray.length();
        JSONObject jsonObject;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            this.addOrReplaceCollisionMask(jsonObject);
        }   
    }

    public Rectangle getRectangle(final BufferedImage bufferedImage) {
        
        final int transparentColor = BasicColorFactory.getInstance().TRANSPARENT_COLOR.intValue();

        final int width = bufferedImage.getWidth();
        final int height = bufferedImage.getHeight();
        
        int minX = width;
        int maxX = 0;
        int minY = height;
        int maxY = 0;

        int rgb;
        for(int indexX = 0; indexX < width; indexX++) {
            for(int indexY = 0; indexY < height; indexY++) {
                rgb = bufferedImage.getRGB(indexX, indexY);
                if (rgb != transparentColor) {
                    
                    if(indexX < minX) {
                        minX = indexX;
                    }
                    
                    if(indexY < minY) {
                        minY = indexY;
                    }

                    if(indexX > maxX) {
                        maxX = indexX;
                    }
                    
                    if(indexY > maxY) {
                        maxY = indexY;
                    }

                }
            }
        }
        
        maxX++;
        maxY++;
        
        final Rectangle rectangle = new Rectangle(PointFactory.getInstance().getInstance(minX, minY), maxX - minX, maxY - minY);
        System.out.println(rectangle.toString());
        return rectangle;
    }
    
    private final String ONE = "1";
    public void addOrReplaceCollisionMask(final JSONObject jsonObject) throws Exception {
        final String assetPath = jsonObject.getString(this.gdProjectStrings.IMAGE);
        final String imagePath = assetPath.substring(this.gdToolStrings.ASSET_PREFIX.length(), assetPath.length());
        final AbFile abFile = new AbFile(this.gdToolStrings.ASSETS_PATH + imagePath);
        if(abFile.isFile()) {
            System.out.println(LOAD_IMAGE + imagePath);
            final BufferedImage bufferedImage = ImageIO.read(AbFileNativeUtil.get(abFile));

            //Hack for make sprites shorter than original asset.
            int adjustMaxY = bufferedImage.getHeight();
            final int underScoreIndex = imagePath.lastIndexOf('_');
            String imagePath2 = null;
            if (underScoreIndex >= 0) {
                final int periodIndex = imagePath.lastIndexOf('.');
                imagePath2 = new StringMaker().append(imagePath.substring(0, underScoreIndex + 1)).append(ONE).append(imagePath.substring(periodIndex)).toString();
                final AbFile abFile2 = new AbFile(this.gdToolStrings.RESOURCES_PATH + imagePath2);
                if (abFile2.isFile()) {
                    //System.out.println(LOAD_SPRITE + imagePath2);
                    final BufferedImage bufferedImage2 = ImageIO.read(AbFileNativeUtil.get(abFile2));
                    if(adjustMaxY > bufferedImage2.getHeight()) {
                        //System.out.println(ADJUSTING_HEIGHT + imagePath2);
                        adjustMaxY = bufferedImage2.getHeight();
                    }
                }
            }
            
            final Rectangle rectangle = this.getRectangle(bufferedImage);
            final int height = adjustMaxY - rectangle.getPoint().getY();
            if(rectangle.getHeight() > height) {
                System.out.println(ADJUSTING_HEIGHT + imagePath2);
                rectangle.setHeight(height);
            }
            
            final JSONArray customCollisionMaskJSONArray = this.getCustomCollisionMask(rectangle);
            jsonObject.put(this.gdProjectStrings.CUSTOM_COLLISION_MASK, customCollisionMaskJSONArray);
        } else {
            System.out.println(SKIPPING_IMAGE + imagePath);
        }
        
    }
    
    public JSONArray getCustomCollisionMask(final Rectangle rectangle) {
        final JSONArray customCollisionMaskJSONArray = new JSONArray();
        final JSONArray firstCustomCollisionMaskJSONArray = new JSONArray();
        customCollisionMaskJSONArray.put(firstCustomCollisionMaskJSONArray);
        
        final JSONObject topLeftJSONObject = new JSONObject();
        final JSONObject topRightJSONObject = new JSONObject();
        final JSONObject bottomLeftJSONObject = new JSONObject();
        final JSONObject bottomRightJSONObject = new JSONObject();
        
        topLeftJSONObject.put(positionStrings.X, rectangle.getPoint().getX());
        topLeftJSONObject.put(positionStrings.Y, rectangle.getPoint().getY());
        
        topRightJSONObject.put(positionStrings.X, rectangle.getMaxX());
        topRightJSONObject.put(positionStrings.Y, rectangle.getPoint().getY());

        bottomLeftJSONObject.put(positionStrings.X, rectangle.getPoint().getX());
        bottomLeftJSONObject.put(positionStrings.Y, rectangle.getMaxY());
        
        bottomRightJSONObject.put(positionStrings.X, rectangle.getMaxX());
        bottomRightJSONObject.put(positionStrings.Y, rectangle.getMaxY());
        
        firstCustomCollisionMaskJSONArray.put(topLeftJSONObject);
        firstCustomCollisionMaskJSONArray.put(topRightJSONObject);
        firstCustomCollisionMaskJSONArray.put(bottomRightJSONObject);
        firstCustomCollisionMaskJSONArray.put(bottomLeftJSONObject);
        
        return customCollisionMaskJSONArray;
    }
        
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        final GDCustomCollisionMaskImageGenerator gdImageMaskGenerator = new GDCustomCollisionMaskImageGenerator();
        
        gdImageMaskGenerator.process();
    }
        
}
