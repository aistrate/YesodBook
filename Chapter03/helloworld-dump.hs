    mkYesod
      "HelloWorld"
      [yesod-routes-1.2.0.1:Yesod.Routes.TH.Types.ResourceLeaf
         (yesod-routes-1.2.0.1:Yesod.Routes.TH.Types.Resource
            "HomeR"
            []
            (yesod-routes-1.2.0.1:Yesod.Routes.TH.Types.Methods
               Nothing ["GET"])
            [])]
  ======>
    helloworld.hs:(8,1)-(10,2)
    instance ParseRoute HelloWorld where
      parseRoute (pieces0_a3CJ, _query_a3CL)
        = Control.Monad.join (dispatch_a3CK pieces0_a3CJ)
        where
            dispatch_a3CK
              = Yesod.Routes.Dispatch.toDispatch
                  [Yesod.Routes.Dispatch.Route
                     []
                     False
                     (\ pieces_a3CM
                        -> case pieces_a3CM of {
                             [] -> do { Just (Just HomeR) }
                             _ -> error "Invariant violated" })]



    instance RenderRoute HelloWorld where
      data instance Route HelloWorld
        = HomeR
        deriving (Show, Eq, Read)
      renderRoute HomeR = ([], [])



    instance RouteAttrs HelloWorld where
      routeAttrs (HomeR {})
        = containers-0.5.0.0:Data.Set.Base.fromList []
    resourcesHelloWorld ::
      [yesod-routes-1.2.0.1:Yesod.Routes.TH.Types.ResourceTree String]
    resourcesHelloWorld
      = [yesod-routes-1.2.0.1:Yesod.Routes.TH.Types.ResourceLeaf
           (yesod-routes-1.2.0.1:Yesod.Routes.TH.Types.Resource
              "HomeR"
              []
              (yesod-routes-1.2.0.1:Yesod.Routes.TH.Types.Methods
                 Nothing ["GET"])
              [])]
    type Handler = HandlerT HelloWorld IO
    type Widget = WidgetT HelloWorld IO GHC.Tuple.()



    instance YesodDispatch HelloWorld where
      yesodDispatch yesod_dispatch_env0_a3Cy req0_a3Cz
        = case dispatch_a3CA (Network.Wai.pathInfo req0_a3Cz) of {
            Just f_a3CI -> f_a3CI yesod_dispatch_env0_a3Cy req0_a3Cz
            Nothing
              -> yesodRunner
                   (notFound >> (return GHC.Tuple.()))
                   yesod_dispatch_env0_a3Cy
                   Nothing
                   req0_a3Cz }
        where
            dispatch_a3CA
              = Yesod.Routes.Dispatch.toDispatch
                  [Yesod.Routes.Dispatch.Route
                     []
                     False
                     (\ pieces_a3CB
                        -> case pieces_a3CB of {
                             []
                               -> do { Just
                                         (\ yesod_dispatch_env_a3CE req_a3CF
                                            -> case
                                                   containers-0.5.0.0:Data.Map.Base.lookup
                                                     (Network.Wai.requestMethod req_a3CF)
                                                     methodsHomeR
                                               of {
                                                 Just f_a3CH
                                                   -> let handler_a3CG = f_a3CH
                                                      in
                                                        handler_a3CG
                                                          yesod_dispatch_env_a3CE
                                                          (Just HomeR)
                                                          req_a3CF
                                                 Nothing
                                                   -> yesodRunner
                                                        (badMethod >> (return GHC.Tuple.()))
                                                        yesod_dispatch_env_a3CE
                                                        (Just HomeR)
                                                        req_a3CF }) }
                             _ -> error "Invariant violated" })]
            methodsHomeR
              = containers-0.5.0.0:Data.Map.Base.fromList
                  [((Data.Text.Encoding.encodeUtf8 . Data.Text.pack) "GET", 
                    yesodRunner getHomeR)]