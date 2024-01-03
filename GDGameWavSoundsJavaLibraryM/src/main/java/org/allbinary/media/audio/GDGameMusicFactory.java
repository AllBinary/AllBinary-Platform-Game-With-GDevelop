
        //game
        
                //instancesAsString=,
                //createdObjectsAsString=,
                //objectsAsString=,Sprite:Player,
                //externalEventActionModVarSceneAsString=,
                
                package org.allbinary.media.audio;

                import org.allbinary.logic.string.CommonStrings;
                import org.allbinary.logic.string.CommonSeps;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.util.ArrayUtil;
                import org.allbinary.util.BasicArrayList;

                public class GDGameMusicFactory
                {

                    private static final GDGameMusicFactory instance = new GDGameMusicFactory();

                    public static GDGameMusicFactory getInstance()
                    {
                        return instance;
                    }

                    private final CommonStrings commonStrings = CommonStrings.getInstance();

                    public final BasicArrayList soundList = new BasicArrayList();

                    public GDGameMusicFactory() {

                        try {
                        
                            LogUtil.put(LogFactory.getInstance(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR));



                
                //Resources
                                       
                    //Audio File with Action - two_dark_fantasy_studio_start_your_engine.ogg
                    if(!soundList.contains(org.allbinary.game.resource.GDTwoDarkFantasyStudioStartYourEngineSound.getInstance())) {
                    
                        soundList.add(org.allbinary.game.resource.GDTwoDarkFantasyStudioStartYourEngineSound.getInstance());
                    }
                    
                //Resources
                                       
                    //Audio File with Action - two_dark_fantasy_studio_start_your_engine.ogg
                    if(!soundList.contains(org.allbinary.game.resource.GDTwoDarkFantasyStudioStartYourEngineSound.getInstance())) {
                    
                        soundList.add(org.allbinary.game.resource.GDTwoDarkFantasyStudioStartYourEngineSound.getInstance());
                    }
                    

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        }

                    }

                }

    
